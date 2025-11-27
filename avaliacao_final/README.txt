 Cenário fictício: loja virtual de produtos elétricos A EletroFranca é uma loja virtual de Franca–SP que vende materiais elétricos para residências pequenas indústrias e instaladores profissionais. A empresa nasceu de uma distribuidora física e quer integrar catálogo, estoque em múltiplos depósitos, fornecedores, preços dinâmicos e entregas por transportadoras locais. . O sistema precisa centralizar cadastro de produtos, fornecedores, categorias, estoque por depósito, pedidos, pagamentos e envio.
- Descrição da empresa:  EletroFranca Ltda., CNPJ 12.345.678/0001-99, foco em cabos, disjuntores, tomadas, luminárias, painéis. Atende Brasil todo, com principais depósitos em Franca, Ribeirão Preto e Uberaba.
- Problema/necessidade: estoques inconsistentes, dificuldade de manter relações produto-fornecedor, categorização pobre, pagamentos e faturas fora do pedido.
- Objetivo do sistema: unificar catálogo e estoque multi-depósito; formalizar pedidos, itens, pagamentos e remessas; permitir N:N com fornecedores e categorias; suportar atributos compostos (endereço), e derivados (totais).
Modelagem conceitual Abaixo estão as entidades:
Entidades e atributos
Cliente: id_cliente, nome, contato, cpf, data_nascimento (DATE), endereco (cep, logradouro, numero, complemento, bairro, cidade, estado)
Fornecedor: id_fornecedor, nome, contato, CNPJ, endereco (cep, logradouro, numero, complemento, bairro, cidade, estado).
Categoria: id_categoria, Iluminacao, cabos, placas_e_modulos, ferramentas, insumos.
sub_categoria: Iluminacao: painel_de_led, lustre, spot, fita_de_led, lampadas. 
cabos: pp, paralelo, flex, semi_rigido, aluminio, alta_temperatura. 
placas_e_modulos: placa, suporte, tomada, interruptor, modulo_geral. 
erramentas: manuais, eletricas, bateria, epi. 
insumos:isolantes, conectores, terminais,
Produto: id_produto, nome, desc, valor_venda, valor_compra, estoque.
Pedido: id_pedido, data_pedido, status_pedido, iten, total_pedido
item: id_iten, produto, quantidade, unitario, total_iten
Pagamento: id_pagamento, metodo, status_pagamento.
Envio: id_envio, status_envio, rastreio.
Relacionamentos e cardinalidades
-cliente 1:N pedido -pedido 1:N envio -pedido 1:N Item -pedido 1:N pagamento -item 1:1 produto -produto N:N fornecedor -categoria 1:N produto -categoria 1:N "sub_categoria"
DER
- Atributos compostos:
- Atributos multivalorados:
- Atributos derivados:
- Chaves primárias:
- Relacionamentos
Modelagem lógica relacional A seguir, o modelo lógico com tipos de dados e chaves.

