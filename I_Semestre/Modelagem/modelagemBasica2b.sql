/* Verificando os bancos de dados existentes*/
SHOW DATABASES;

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

/* Listando os produtos */
SELECT * FROM produto;

/* AVG() retorna o valor medio da coluna preco da tabela produto*/
SELECT AVG(preco) AS mediaPreco FROM produto;

/* Retorna o nome e o preco dos produtos que tem o valor acima da media*/
SELECT nome, preco 
FROM produto 
WHERE preco > (SELECT AVG(preco) FROM produto);

/* COUNT() retorna o numero de linhas da tabela produto*/
SELECT COUNT(*) AS totalProdutos FROM produto;

/* COUNT() retorna o numero de linhas da tabela produto onde o preco é maior que 10*/
SELECT COUNT(*) AS totalProdutosCaros
FROM produto
WHERE preco > 10;

/* COUNT(DISCTINCT) retorna o numero de valores distintos da coluna preco da tabela produto*/
SELECT COUNT(DISTINCT preco) AS totalPrecosDistintos FROM produto;

SELECT DISTINCT preco FROM produto;

/* LIMIT "n" retorna as primeiras "n" linhas da tabela produto*/
/* Retorna o produto mais barato*/
SELECT * FROM produto ORDER BY preco LIMIT 1;
/* Retorna o produto mais caro*/
SELECT * FROM produto ORDER BY preco DESC LIMIT 1;

/* SUM() retorna a soma dos valores da coluna quantidade da tabela produto*/
SELECT SUM(quantidade) AS totalProdutos FROM produto;


/* Exemplo extra */
/* Retorna os clientes em ordem decrescente de acordo com o total de compras*/
SELECT id_cliente, SUM(valor) AS totalCompras
FROM pagamento
GROUP BY id_cliente
ORDER BY totalCompras DESC;

/* Funcoes com strings */
/* Retorna o tamanho da string */
SELECT LENGTH('1234567890');

/* Recorta os espaços em branco do inicio e do fim da string */
SELECT TRIM('  1234567890  ');

/* Recorta os espaços em branco a esquerda da string */
SELECT LTRIM('  1234567890  ');
/* Recorta os espaços em branco a direita da string */
SELECT RTRIM('  1234567890  ');

/* Recorta uma letra do inicio e do fim da string */
SELECT TRIM('a' FROM 'aaaa1234567890aaaa');
/* Recorta uma letra do inicio da string */
SELECT LTRIM('a' FROM 'aaaa1234567890aaaa');

/* Coverte a string para maiuscula */
SELECT UPPER('aaaaaaaaaa');
/* Coverte a string para minuscula */
SELECT LOWER('AAaaaaaaaA');

/* Retorna as 4 primeiras letras da string */
SELECT LEFT('1234567890', 4);
/* Retorna as 4 ultimas letras da string */
SELECT RIGHT('1234567890', 4);

/* Concatena duas strings */
SELECT CONCAT('123', '4567890');

/* Excluindo '.' de uma string */
SELECT REPLACE('123.456.789-0', '.', '');

/* Excluindo '.' e '-' de uma string */
SELECT REPLACE(REPLACE('123.456.789-0', '.', ''), '-','');