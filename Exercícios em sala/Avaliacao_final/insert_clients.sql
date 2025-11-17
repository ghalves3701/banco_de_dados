-- Categorias (20)
insert into categorias (nome, descricao)
select 'Categoria ' || gs::text, 'Linha ' || gs::text
from generate_series(1,20) gs;

-- Clientes (1000)
insert into clientes (nome, cpf, email_principal, data_nascimento)
select
  'Cliente ' || gs::text,
  lpad(gs::text, 11, '0'), -- placeholder (ajuste para 11 dígitos, formatação pode ser aplicada depois)
  'cliente' || gs::text || '@exemplo.com',
  date '1980-01-01' + (gs % 15000) * interval '1 day'
from generate_series(1,1000) gs;

-- Telefones (2 por cliente em média)
insert into clientes_telefones (id_cliente, telefone)
select c.id_cliente, '(' || (10 + (c.id_cliente % 20))::text || ')9' || lpad((c.id_cliente % 10000)::text, 8, '0')
from clientes c
union all
select c.id_cliente, '(' || (11 + (c.id_cliente % 20))::text || ')9' || lpad(((c.id_cliente+123) % 10000)::text, 8, '0')
from clientes c
where c.id_cliente % 2 = 0;

-- Endereços de clientes
insert into clientes_enderecos (id_cliente, rua, numero, complemento, bairro, cidade, estado, cep)
select id_cliente,
       'Rua ' || id_cliente::text,
       (100 + id_cliente % 900)::text,
       null,
       'Bairro ' || (id_cliente % 50)::text,
       'Franca',
       'SP',
       lpad((10000000 + id_cliente)::text, 8, '0')
from clientes;

-- Produtos (1000)
insert into produtos (id_categoria, nome, sku, preco_base)
select
  (1 + (gs % 20))::bigint,
  'Produto ' || gs::text,
  'SKU-' || lpad(gs::text, 6, '0'),
  round( (10 + (random()*490))::numeric, 2 )
from generate_series(1,1000) gs;

-- Fornecedores (100)
insert into fornecedores (razao_social, cnpj, email_contato)
select
  'Fornecedor ' || gs::text,
  lpad(gs::text, 14, '0'),
  'forn' || gs::text || '@exemplo.com'
from generate_series(1,100) gs;

insert into fornecedores_enderecos (id_fornecedor, rua, numero, bairro, cidade, estado, cep)
select id_fornecedor,
       'Av ' || id_fornecedor::text,
       (100 + id_fornecedor % 900)::text,
       'Centro',
       'Franca',
       'SP',
       lpad((14000000 + id_fornecedor)::text, 8, '0')
from fornecedores;

-- Produto x Fornecedor (cada fornecedor fornece ~10 produtos)
insert into produtos_fornecedores (id_produto, id_fornecedor, preco_custo, lead_time_dias)
select p.id_produto, f.id_fornecedor,
       round((p.preco_base * (0.5 + random()*0.4))::numeric, 2),
       3 + (random()*12)::int
from fornecedores f
join lateral (
  select id_produto from produtos
  where id_produto % 100 = f.id_fornecedor % 100
  limit 10
) p on true;

-- Movimentos de estoque (entrada inicial 50 un por produto)
insert into movimentos_estoque (id_produto, tipo_mov, quantidade, observacao)
select id_produto, 'ENTRADA', 50, 'Estoque inicial'
from produtos;

-- Pedidos (5000)
insert into pedidos (id_cliente, status, data_pedido)
select c.id_cliente,
       (array['ABERTO','PAGO','CANCELADO'])[1 + (random()*2)::int],
       now() - (random()*60)::int * interval '1 day'
from clientes c
limit 5000;

-- Itens do pedido (1 a 5 itens por pedido)
insert into itens_pedido (id_pedido, id_produto, quantidade, preco_unitario, desconto_percentual)
select p.id_pedido,
       pr.id_produto,
       1 + (random()*4)::int,
       pr.preco_base,
       (case when random() < 0.2 then 5 else 0 end)
from pedidos p
join lateral (
  select id_produto, preco_base
  from produtos
  order by random()
  limit 1 + (random()*4)::int
) pr on true;

-- Faturas (1 por pedido, valor igual ao total da view)
insert into faturas (id_pedido, forma_pagamento, valor, status)
select v.id_pedido,
       (array['PIX','CARTAO','BOLETO'])[1 + (random()*2)::int],
       v.total_pedido,
       (case when (select status from pedidos p where p.id_pedido = v.id_pedido) = 'PAGO'
             then 'PAGA'
             else 'EMITIDA' end)
from vw_total_pedido v;