/* ACESSAR O BANCO DE DADOS COMERCIO CRIADO EM modelagemBasica2b.sql*/

/* Criando banco de dados comercio*/
CREATE DATABASE comercio;

/* Acessando um banco de dados */
USE comercio;

/* Criando a tabela produto */
CREATE TABLE produto(
    id_produto INT auto_increment PRIMARY KEY,
    nome VARCHAR(30),
    preco DECIMAL(10,2),
    quantidade INT
);

/* Verificando as tabelas do banco de dados */
SHOW TABLES;

/* Verificando a estrutura de uma tabela */
DESC produto;

/* Adicionando dados na tabela produto */
INSERT INTO produto (nome, preco, quantidade) VALUES ('Arroz', 10.00, 100);
INSERT INTO produto (nome, preco, quantidade) VALUES ('Feijão', 8.00, 200);
INSERT INTO produto (nome, preco, quantidade) VALUES ('Macarrão', 5.00, 150);
INSERT INTO produto (nome, preco, quantidade) VALUES ('Açucar', 3.00, 300);
INSERT INTO produto (nome, preco, quantidade) VALUES ('Café', 7.00, 100);
INSERT INTO produto (nome, preco, quantidade) VALUES ('Leite', 3.50, 200);
INSERT INTO produto (nome, preco, quantidade) VALUES ('Carne', 20.00, 50);
INSERT INTO produto (nome, preco, quantidade) VALUES ('Frango', 15.00, 100);
INSERT INTO produto (nome, preco, quantidade) VALUES ('Peixe', 25.00, 50);
INSERT INTO produto (nome, preco, quantidade) VALUES ('Ovos', 5.00, 100);

/* 1. Listar todos os produtos */


/* 2. RetornaRetorna os 5 produtos mais baratos */


/* 3. RetornaRetorna os 5 produtos mais caros */


/* 4. Retorna o nome, preco, quuantidade e a soma dos precos de cada rpoduto */


/* 5. Retorna a soma total do preco de todos os produtos */


/* 6. Retorna todos os produtos em ordem alfabetica */


/* 7. Retorna todos os produtos em ordem crescente de preco */


/* 8. Retorna todos os produtos em ordem decrescente de preco */


/* 9. Retorna o nome e o preco dos produtos que tem o valor abaixo da media */


