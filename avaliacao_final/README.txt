Cenário fictício: loja virtual de produtos elétricos
A história é simples: a EletroFranca é uma loja virtual de Franca–SP que vende materiais elétricos para residências, pequenas indústrias e instaladores profissionais. A empresa nasceu de uma distribuidora física e quer integrar catálogo, estoque em múltiplos depósitos, fornecedores, preços dinâmicos e entregas por transportadoras locais. .
O sistema precisa centralizar cadastro de produtos (com variações de voltagem e potência), fornecedores (com custos e prazos), categorias, estoque por depósito, pedidos, pagamentos e envio. Precisa também de um programa de fidelidade por cliente, imagens e tags de produto, e auditoria do total de pedido.
- Descrição da empresa: EletroFranca Ltda., CNPJ 12.345.678/0001-99, foco em cabos, disjuntores, tomadas, luminárias, painéis. Atende Brasil todo, com principais depósitos em Franca, Ribeirão Preto e Uberaba.
- Problema/necessidade: estoques inconsistentes, dificuldade de manter relações produto-fornecedor, categorização pobre, pagamentos e faturas fora do pedido, ausência de fidelidade.
- Objetivo do sistema: unificar catálogo e estoque multi-depósito; formalizar pedidos, itens, pagamentos e remessas; permitir N:N com fornecedores e categorias; oferecer fidelidade 1:1 por cliente; suportar atributos compostos (endereço), multivalorados (tags, imagens) e derivados (totais).

Modelagem conceitual
Abaixo estão entidades, atributos e relacionamentos com cardinalidades e tipos de atributos requeridos.
Entidades e atributos

Company (Empresa):
- Atributos simples: id (PK), nome, cnpj, email, phone
- Atributo composto: address = {street, number, district, city, state, cep}
- Atributo derivado: total_products (derivado de relação com Product via visão)
- Observação: 1:N com Product

- Customer (Cliente):
- Atributos simples: id (PK), full_name, cpf, email, phone, created_at
- Atributo composto: address = {street, number, district, city, state, cep}
- Relacionamentos: 1:N com Order; 1:1 com LoyaltyCard

- LoyaltyCard (Cartão fidelidade):
- Atributos simples: id (PK), code, points, tier, issued_at
- Relacionamento 1:1: cada Customer possui no máximo um LoyaltyCard; cada LoyaltyCard pertence a um Customer

Supplier (Fornecedor):
- Atributos simples: id (PK), name, cnpj, email, phone
- Atributo composto: address = {street, number, district, city, state, cep}
- Relacionamento N:N com Product via ProductSupplier

Category (Categoria):
- Atributos simples: id (PK), name, description
- Relacionamento N:N com Product via ProductCategory
- Relacionamento 1:N recursivo: parent_category 1:N child_categories

- Warehouse (Depósito):
- Atributos simples: id (PK), name
- Atributo composto: address = {street, number, district, city, state, cep}
- Relacionamento 1:N com Inventory

Product (Produto):
- Atributos simples: id (PK), sku, name, description, brand, unit_price, power_watts, warranty_months, created_at
- Atributo simples padronizado: voltage (ex.: 110V/220V/Bivolt)
- Atributo multivalorado: tags (ex.: TEXT[])
- Relacionamentos: 1:N com Inventory (por depósito); N:N com Category; N:N com Supplier; 1:N com ProductImage; N:N indireto com Order via OrderItem

ProductImage (Imagem de produto):
- Atributos simples: id (PK), url, alt_text
- Relacionamento 1:N: Product 1:N ProductImage
- Observação: representa atributo multivalorado como entidade

Inventory (Estoque):
- Atributos simples: id (PK), quantity_on_hand, quantity_reserved
- Atributo derivado: available_quantity = quantity_on_hand − quantity_reserved
- Relacionamentos: produto 1:N no contexto por depósito (chave composta product+warehouse)

Order (Pedido):
- Atributos simples: id (PK), order_number, order_date, status
- Atributo derivado: order_total (soma de OrderItem.total_line)
- Relacionamentos: 1:N com OrderItem; 1:1 com Payment; 1:N com Shipment; N:1 com Customer

OrderItem (Item do pedido):
- Atributos simples: id (PK), quantity, unit_price, discount_percent
- Atributo derivado interno: total_line = quantity × unit_price × (1 − discount_percent/100)
- Relacionamentos: N:1 com Order; N:1 com Product

Payment (Pagamento):
- Atributos simples: id (PK), method, amount, status, paid_at
- Relacionamento 1:1: cada Order tem no máximo um Payment e vice-versa

Shipment (Envio):
- Atributos simples: id (PK), carrier, tracking_code, shipped_at, delivered_at, status
- Relacionamento 1:N: Order 1:N Shipment (um pedido pode ter múltiplos envios/volumes)

Relacionamentos e cardinalidades
- Company 1:N Product — uma empresa vende muitos produtos.
- Customer 1:1 LoyaltyCard — um cliente tem um cartão, um cartão pertence a um cliente.
- Customer 1:N Order — um cliente faz muitos pedidos.
- Order 1:N Shipment — um pedido pode ter várias remessas.
- Order 1:1 Payment — um pedido tem exatamente um pagamento (regra do negócio).
- Order 1:N OrderItem — um pedido tem vários itens.
- Product N:N Category — produto pode pertencer a várias categorias e categoria ter muitos produtos.
- Product N:N Supplier — um produto pode ter vários fornecedores e fornecedor fornecer diversos produtos.
- Product 1:N ProductImage — várias imagens por produto.
- Product 1:N Inventory via Warehouse — o mesmo produto aparece em vários depósitos, cada par (product, warehouse) tem um registro de estoque.
- Category 1:N Category (recursivo) — categorias pai/filhas.

DER textual:
Company (1) ───< Product (N)
Customer (1) ─── Order (N) ───< OrderItem (N) >─── Product (N)
Customer (1) ─── LoyaltyCard (1)
Order (1) ─── Payment (1)
Order (1) ───< Shipment (N)
Product (1) ───< ProductImage (N)
Product (N) ───< ProductCategory >─── (N) Category
Product (N) ───< ProductSupplier >─── (N) Supplier
Product (N) ───< Inventory (N) >─── Warehouse (N)
Category (1) ───< Category (N) [parent_category_id]

- Atributos compostos: address em Company, Customer, Supplier, Warehouse.
- Atributos multivalorados: Product.tags e a entidade ProductImage.
- Atributos derivados: Inventory.available_quantity, OrderItem.total_line, Order.order_total (via visão).
- Chaves primárias: id em todas as entidades (ou chaves compostas nas tabelas de junção).
- Relacionamentos 1:1, 1:N, N:N: previstos acima.

Modelagem lógica relacional
A seguir, o modelo lógico com tipos de dados e chaves.
Tabelas principais
- company
- PK: id
- Campos: name (VARCHAR), cnpj (VARCHAR), email (VARCHAR), phone (VARCHAR), address_* (VARCHAR)
- customer
- PK: id
- Campos: full_name (VARCHAR), cpf (VARCHAR), email (VARCHAR UNIQUE), phone (VARCHAR), address_* (VARCHAR), created_at (TIMESTAMPTZ)
- loyalty_card
- PK: id
- FK: customer_id UNIQUE REFERENCES customer(id)
- Campos: code (VARCHAR UNIQUE), points (INT), tier (VARCHAR), issued_at (TIMESTAMPTZ)
- supplier
- PK: id
- Campos: name, cnpj, email, phone, address_* (VARCHAR)
- category
- PK: id
- FK: parent_category_id REFERENCES category(id)
- Campos: name (VARCHAR), description (TEXT)
- warehouse
- PK: id
- Campos: name (VARCHAR), address_* (VARCHAR)
- product
- PK: id
- FK: company_id REFERENCES company(id)
- Campos: sku (VARCHAR UNIQUE), name (VARCHAR), description (TEXT), brand (VARCHAR), unit_price (DECIMAL(12,2)), voltage (VARCHAR), power_watts (INT), warranty_months (INT), tags (TEXT[]), created_at (TIMESTAMPTZ)
- product_image
- PK: id
- FK: product_id REFERENCES product(id)
- Campos: url (TEXT), alt_text (VARCHAR)
- product_category
- PK composta: (product_id, category_id)
- FKs: product_id REFERENCES product(id), category_id REFERENCES category(id)
- product_supplier
- PK composta: (product_id, supplier_id)
- FKs: product_id REFERENCES product(id), supplier_id REFERENCES supplier(id)
- Campos: supplier_sku (VARCHAR), cost_price (DECIMAL(12,2))
- inventory
- PK: id
- Único: (product_id, warehouse_id)
- FKs: product_id REFERENCES product(id), warehouse_id REFERENCES warehouse(id)
- Campos: quantity_on_hand (INT), quantity_reserved (INT)
- Derivado lógico: available_quantity = quantity_on_hand − quantity_reserved (em visão)
- order
- PK: id
- FK: customer_id REFERENCES customer(id)
- Campos: order_number (VARCHAR UNIQUE), order_date (DATE), status (VARCHAR)
- Derivado lógico: order_total (em visão pela soma de itens)
- order_item
- PK: id
- FKs: order_id REFERENCES order(id), product_id REFERENCES product(id)
- Campos: quantity (INT), unit_price (DECIMAL(12,2)), discount_percent (DECIMAL(5,2))
- Derivado físico: total_line (generated column)
- payment
- PK: id
- FK: order_id UNIQUE REFERENCES order(id)
- Campos: method (VARCHAR), amount (DECIMAL(12,2)), status (VARCHAR), paid_at (TIMESTAMPTZ)
- shipment
- PK: id
- FK: order_id REFERENCES order(id)
- Campos: carrier (VARCHAR), tracking_code (VARCHAR), shipped_at (TIMESTAMPTZ), delivered_at (TIMESTAMPTZ), status (VARCHAR)
