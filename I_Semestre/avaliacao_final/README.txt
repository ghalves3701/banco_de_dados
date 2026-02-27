 Cenário fictício: loja virtual de produtos elétricos A EletroFranca é uma loja virtual de Franca–SP que vende materiais elétricos para residências pequenas indústrias e instaladores profissionais. A empresa nasceu de uma distribuidora física e quer integrar catálogo, estoque em múltiplos depósitos, fornecedores, preços dinâmicos e entregas por transportadoras locais. . O sistema precisa centralizar cadastro de produtos, fornecedores, categorias, estoque por depósito, pedidos, pagamentos e envio.
- Descrição da empresa:  EletroFranca Ltda., CNPJ 12.345.678/0001-99, foco em cabos, disjuntores, tomadas, luminárias, painéis. Atende Brasil todo, com principais depósitos em Franca, Ribeirão Preto e Uberaba.
- Problema/necessidade: estoques inconsistentes, dificuldade de manter relações produto-fornecedor, categorização pobre, pagamentos e faturas fora do pedido.
- Objetivo do sistema: unificar catálogo e estoque multi-depósito; formalizar pedidos, itens, pagamentos e remessas; permitir N:N com fornecedores e categorias; suportar atributos compostos (endereço), e derivados (totais).

Nos envios, a empresa necessitava de organizar a questão da logística, trazer produtos de um estoque para outro e aproveitar para trazer produtos de vendas que coincidiam com a cidade destino.

Houve a necessidade de criar as tabelas categoria e subcategoria, pois, como atributo, a mesma categoria ou subcategoria poderiam ter vários nomes diferentes, seja por erro de digitação ou abreviações. Além de corrigir problemas como subcategorias em categorias erradas.




**Criando Bd utilizando o MySQL**



CREATE DATABASE Eletro_Franca;
USE Eletro_Franca;

-- Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(40),
    email VARCHAR(40),
    telefone VARCHAR(30),
    rua VARCHAR(30),
    numero VARCHAR(40),
    bairro VARCHAR(30),
    cep INT,
    cpf VARCHAR(20),
    UNIQUE(CPF, email)
);

-- Loja
CREATE TABLE Loja (
    id_loja INT PRIMARY KEY,
    nome VARCHAR(30) UNIQUE,
    rua VARCHAR(50),
    numero INT,
    bairro VARCHAR(30),
    cep INT,
    telefone INT
);

-- Compra
CREATE TABLE Compra (
    id_compra INT PRIMARY KEY,
    data DATE,
    valor_total DECIMAL(10,2),
    id_cliente INT,
    id_loja INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_loja) REFERENCES Loja(id_loja)
);

-- Pagamento
CREATE TABLE Pagamento (
    id_pagamento INT PRIMARY KEY,
    forma_pagto VARCHAR(30),
    valor DECIMAL(10,2),
    parcelas INT,
    status VARCHAR(10),
    id_compra INT,
    FOREIGN KEY (id_compra) REFERENCES Compra(id_compra)
);

-- Funcionário
CREATE TABLE Funcionario (
    id_func INT PRIMARY KEY,
    nome VARCHAR(40),
    cargo VARCHAR(20),
    salario DECIMAL(10,2),
    dt_contratacao DATE,
    id_loja INT,
    FOREIGN KEY (id_loja) REFERENCES Loja(id_loja)
);

-- Fornecedor
CREATE TABLE Fornecedor (
    id_fornecedor INT PRIMARY KEY,
    nome_fornecedor VARCHAR(30),
    end_fornecedor VARCHAR(50),
    contato VARCHAR(30)
);

-- Categoria
CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(30)
);

-- Subcategoria
CREATE TABLE Subcategoria (
    id_subcategoria INT PRIMARY KEY,
    nome_subcategoria VARCHAR(30),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

-- Produto
CREATE TABLE Produto (
    id_produto INT PRIMARY KEY,
    nome_pdt VARCHAR(40),
    descricao VARCHAR(100),
    valor_venda DECIMAL(10,2),
    valor_compra DECIMAL(10,2),
    id_func INT,
    id_fornecedor INT,
    id_subcategoria INT,
    FOREIGN KEY (id_func) REFERENCES Funcionario(id_func),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor),
    FOREIGN KEY (id_subcategoria) REFERENCES Subcategoria(id_subcategoria)
);

-- Estoque
CREATE TABLE Estoque (
    id_estoque INT PRIMARY KEY,
    nome_estq VARCHAR(30),
    end_estq VARCHAR(50)
);

-- Transportadora
CREATE TABLE Transportadora (
    id_transportadora INT PRIMARY KEY,
    nome_transp VARCHAR(30),
    end_transp VARCHAR(50),
    tel_transp VARCHAR(20)
);

-- Envio
CREATE TABLE Envio (
    id_envio INT PRIMARY KEY,
    status VARCHAR(20),
    valor_envio DECIMAL(10,2),
    end_envio VARCHAR(50),
    id_compra INT,
    id_transportadora INT,
    FOREIGN KEY (id_compra) REFERENCES Compra(id_compra),
    FOREIGN KEY (id_transportadora) REFERENCES Transportadora(id_transportadora)
);

-- Item
CREATE TABLE Item (
    id_item INT PRIMARY KEY,
    quantidade INT,
    valor_unitario DECIMAL(10,2),
    valor_total DECIMAL(10,2),
    id_produto INT,
    id_compra INT,
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_compra) REFERENCES Compra(id_compra)
);

-- Relacionamentos N:N

-- Loja-Produto
CREATE TABLE Loja_Produto (
    id_loja INT,
    id_produto INT,
    PRIMARY KEY (id_loja, id_produto),
    FOREIGN KEY (id_loja) REFERENCES Loja(id_loja),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

-- Fornecedor-Produto
CREATE TABLE Fornecedor_Produto (
    id_fornecedor INT,
    id_produto INT,
    PRIMARY KEY (id_fornecedor, id_produto),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

-- Estoque-Produto
CREATE TABLE Estoque_Produto (
    id_estoque INT,
    id_produto INT,
    quantidade INT,
    PRIMARY KEY (id_estoque, id_produto),
    FOREIGN KEY (id_estoque) REFERENCES Estoque(id_estoque),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);