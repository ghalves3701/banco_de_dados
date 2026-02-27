-- Esquema base
create schema if not exists loja_franca;
set search_path to loja_franca;

-- CLIENTES
create table clientes (
  id_cliente bigserial primary key,
  nome varchar(120) not null,
  cpf varchar(14) unique not null,
  email_principal varchar(180) unique not null,
  data_nascimento date not null,
  criado_em timestamp default now()
);

create table clientes_telefones (
  id_cliente bigint not null references clientes(id_cliente) on delete cascade,
  telefone varchar(20) not null,
  primary key (id_cliente, telefone)
);

create table clientes_enderecos (
  id_endereco bigserial primary key,
  id_cliente bigint not null references clientes(id_cliente) on delete cascade,
  rua varchar(150) not null,
  numero varchar(20) not null,
  complemento varchar(100),
  bairro varchar(100) not null,
  cidade varchar(100) not null,
  estado char(2) not null,
  cep varchar(10) not null,
  tipo varchar(20) default 'RESIDENCIAL' -- opcional
);

-- CATEGORIAS
create table categorias (
  id_categoria bigserial primary key,
  nome varchar(120) not null unique,
  descricao text
);

-- PRODUTOS
create table produtos (
  id_produto bigserial primary key,
  id_categoria bigint not null references categorias(id_categoria),
  nome varchar(150) not null,
  sku varchar(40) not null unique,
  preco_base decimal(12,2) not null check (preco_base >= 0),
  criado_em timestamp default now()
);

-- FORNECEDORES
create table fornecedores (
  id_fornecedor bigserial primary key,
  razao_social varchar(180) not null,
  cnpj varchar(18) unique not null,
  email_contato varchar(180),
  criado_em timestamp default now()
);

create table fornecedores_enderecos (
  id_endereco bigserial primary key,
  id_fornecedor bigint not null references fornecedores(id_fornecedor) on delete cascade,
  rua varchar(150) not null,
  numero varchar(20) not null,
  bairro varchar(100) not null,
  cidade varchar(100) not null,
  estado char(2) not null,
  cep varchar(10) not null
);

-- PRODUTO x FORNECEDOR (N:N)
create table produtos_fornecedores (
  id_produto_fornecedor bigserial primary key,
  id_produto bigint not null references produtos(id_produto) on delete cascade,
  id_fornecedor bigint not null references fornecedores(id_fornecedor) on delete cascade,
  preco_custo decimal(12,2) not null check (preco_custo >= 0),
  lead_time_dias int not null check (lead_time_dias >= 0),
  unique (id_produto, id_fornecedor)
);

-- PEDIDOS
create table pedidos (
  id_pedido bigserial primary key,
  id_cliente bigint not null references clientes(id_cliente),
  data_pedido timestamp not null default now(),
  status varchar(20) not null check (status in ('ABERTO','PAGO','CANCELADO'))
);

-- ITENS DO PEDIDO
create table itens_pedido (
  id_item bigserial primary key,
  id_pedido bigint not null references pedidos(id_pedido) on delete cascade,
  id_produto bigint not null references produtos(id_produto),
  quantidade int not null check (quantidade > 0),
  preco_unitario decimal(12,2) not null check (preco_unitario >= 0),
  desconto_percentual numeric(5,2) not null default 0 check (desconto_percentual between 0 and 100)
);

-- FATURA (1:1 com Pedido)
create table faturas (
  id_fatura bigserial primary key,
  id_pedido bigint not null unique references pedidos(id_pedido) on delete cascade,
  forma_pagamento varchar(20) not null check (forma_pagamento in ('PIX','CARTAO','BOLETO')),
  valor decimal(12,2) not null check (valor >= 0),
  status varchar(20) not null check (status in ('EMITIDA','PAGA','CANCELADA')),
  data_emissao timestamp not null default now()
);

-- MOVIMENTOS DE ESTOQUE
create table movimentos_estoque (
  id_mov bigserial primary key,
  id_produto bigint not null references produtos(id_produto) on delete cascade,
  tipo_mov varchar(20) not null check (tipo_mov in ('ENTRADA','SAIDA','AJUSTE')),
  quantidade int not null check (quantidade > 0),
  data_mov timestamp not null default now(),
  observacao text
);

-- VIEWS para atributos derivados
create view vw_total_pedido as
select
  p.id_pedido,
  sum( (i.preco_unitario * i.quantidade) * (1 - i.desconto_percentual/100.0) )::decimal(12,2) as total_pedido
from pedidos p
join itens_pedido i on i.id_pedido = p.id_pedido
group by p.id_pedido;

create view vw_estoque_produto as
select
  pr.id_produto,
  coalesce(sum(case when me.tipo_mov = 'ENTRADA' then me.quantidade
                    when me.tipo_mov = 'SAIDA' then -me.quantidade
                    when me.tipo_mov = 'AJUSTE' then me.quantidade
               end), 0) as estoque_disponivel
from produtos pr
left join movimentos_estoque me on me.id_produto = pr.id_produto
group by pr.id_produto;

create view vw_idade_cliente as
select
  c.id_cliente,
  date_part('year', age(current_date, c.data_nascimento))::int as idade
from clientes c;