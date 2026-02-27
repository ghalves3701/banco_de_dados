/* Criando banco de dados */
CREATE DATABASE veterinaria; /* ";" delimita o final do comando */
CREATE DATABASE teste;
/* Verificando os bancos de dados existentes*/
SHOW DATABASES;
/* Acessando um banco de dados */
USE veterinaria;
/* Criando a tabela cliente */
CREATE TABLE cliente(
    id INT(11) auto_increment PRIMARY KEY,
    nome VARCHAR(30),
    sexo CHAR(1),
    cpf INT(11),
    telefone VARCHAR(30),
    endereco VARCHAR(100)    
);
/* Diferença entre varchar e char
varchar -> tamanho variável
char -> tamanho fixo           */

/* Verificando as tabelas do banco de dados */
show tables;
/* Verificando a estrutura de uma tabela */
DESC cliente;  /* desc -> Describe –> descrever */
/* INSERINDO DADOS NA TABELA */
/* Omitindo as colunas */
INSERT INTO cliente VALUES (NULL,'João', 'M', 988221122, '11111111', 'Av. Brasil, 1234 - Cidade Nova - Franca - SP');
INSERT INTO cliente VALUES (NULL, 'Maria', 'F', 123456789, '22222222', 'Rua José da Silva, 5033 - Centro - Franca - SP');
INSERT INTO cliente VALUES (NULL, 'Pedro', 'M', 1112233445, '12345678', 'Av. Brasil, 1234 - Cidade Nova - Franca - SP');
INSERT INTO cliente VALUES (NULL, 'Clara', 'F', 987654321, '98775555', 'Rua das Flores, 5322 - Centro - São Paulo - SP');
/* Forma 2 – descrevendo as colunas (forma mais segura) */
INSERT INTO cliente (nome,sexo,cpf,telefone,endereco) VALUES ('Ana', 'F', 313233521, "12345678", 'Av. Atlântica, 1004 - Copacabana - Rio de Janeiro - RJ');
INSERT INTO cliente (nome,sexo,cpf,telefone,endereco) VALUES ('Carlos', 'M', 112233999, '99998888', 'Rua das Palmeiras, 1234 - Jardim Botânico - Curitiba - PR');
INSERT INTO cliente (nome,sexo,cpf,telefone,endereco) VALUES ('Marta', 'F', 987654321, '99998888', 'Rua das Palmeiras, 1234 - Jardim Botânico - Curitiba - PR');
INSERT INTO cliente (nome,sexo,cpf,telefone,endereco) VALUES ('Maria', 'F', 214748364, '90011001', 'Rua Presidente Vargas, 2398 - Centro - Belo Horizonte - MG'); 
INSERT INTO cliente (nome,sexo,cpf,telefone,endereco) VALUES ('Irene', 'F', 113455789,'98874555', 'Rua quatro, 701 - Vila ISabel - Rio de Janeiro - RJ');
/* inserindo os campos fora da ordem que foram criados */
INSERT INTO cliente (nome,sexo,cpf,endereco,telefone) VALUES ('José', 'M', 456789123, 'Av. América, 1456 - Jardim América - Belo Horizonte - MG','99997777');
/* inserindo registros sem o campo telefone */
INSERT INTO cliente (nome,sexo,cpf,endereco) VALUES ('Rosa', 'F', 456123123, 'Rua José João, 5776 - Cidade Alta - Salvador - BA');
/* Exemplos de projeção:*/
SELECT NOW(); /*seleciona a data e hora atual: AAAA-MM-DD hh:mm:ss*/
SELECT 'Alessandro'; /*seleciona o texto entre aspas*/
SELECT 'Modelagem de dados'; /*seleciona o texto entre aspas*/
SELECT VERSION(); /*mostra a versão do MySQL*/
SELECT current_date; /*seleciona a data atual: AAAA-MM-DD*/
SELECT user(); /*seleciona o usuário atual do MySQL*/

/* alias de coluna: cria um nome para a visualização da coluna */
SELECT NOW() AS data_processamento;

SELECT NOW() AS data_processamento, 'Alessandro' AS professor;

/* selecione <campos>          de  <tabela>;*/ 
/* seleciona os campos nome, cpf de cliente */
SELECT nome, cpf FROM cliente;
/* seleciona os campos nome, telefone da tabela cliente, renomeia o campo nome para cliente */
SELECT nome AS cliente, telefone FROM cliente;
/* seleciona todos os campos da tabela cliente */
SELECT id,nome,cpf,telefone,endereco FROM cliente;
SELECT * FROM cliente; /* não é recomendado a utilização dessa forma de consulta */
/* seleciona todos os campos da tabela cliente, renomeia o campo nome para cliente, e cria uma coluna chamada data_hora e insere a data e hora atual*/
SELECT nome AS cliente, cpf, telefone, NOW() AS data_hora FROM cliente;

/* Seleciona a pessoa que possui o cpf 123456789 */
SELECT nome
FROM cliente
WHERE cpf = 123456789;

SELECT nome
FROM cliente
WHERE sexo = 'F';
/* Seleciona nome, telefone das clientes que o nome = Maria */
SELECT nome, telefone
FROM cliente
WHERE nome = 'Maria';

/* Seleciona nome, endereco de cliente onde endereço contém 'RJ' */
SELECT nome, endereco
FROM cliente
WHERE endereco = 'RJ';

/* Seleciona nome, endereco de cliente onde endereço contém '<qualquer coisa>RJ' */
SELECT nome, endereco
FROM cliente
WHERE endereco LIKE '%RJ';

/* Seleciona nome, endereco de cliente onde endereço contém 'Av. América<qualquer coisa>' */
SELECT nome, endereco
FROM cliente
WHERE endereco LIKE 'Av. América%';
/* Seleciona nome, endereco de cliente onde endereço contém '<qualquer coisa>Centro<qualquer coisa>' */
SELECT nome, endereco
FROM cliente
WHERE endereco LIKE '%Centro%';
/* LIKE -> %a% , _a_ */

/* ORDER BY -> ordenação - */
SELECT id, nome, endereco
FROM cliente
ORDER BY nome DESC; /* ordena por nome */

/* COUNT() -> conta o número de registros */
SELECT count(*) FROM cliente; /* conta o número de registros da tabela cliente */
SELECT count(*) AS "Quantidade de clientes" FROM cliente;

/* GROUP BY -> agrupamento - agrupa por item da coluna selecionada */

/* agrupa por sexo e conta o número de registros */
SELECT sexo, count(*) AS "Quantidade" 
FROM cliente 
GROUP BY sexo;

/* Selecionando valores nulos */
SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;

/* Selecionando valores não nulos */
SELECT nome, telefone
FROM cliente
WHERE telefone IS NOT NULL;

/* IFNULL -> se o valor for nulo, exibe a mensagem: 'Telefone não informado'*/
SELECT nome, ifnull(telefone,'Telefone não informado') AS telefone
FROM cliente;

/* operadores lógicos
AND -> E - para que a condição seja verdadeira, todas as condições devem ser verdadeiras;
OR -> OU - para que a condição seja verdadeira, pelo menos uma das condições deve ser verdadeira; */

/* Seleciona o nome dos clientes do sexo feminino e que possuem telefone */
SELECT nome, telefone
FROM cliente
WHERE sexo = 'F' AND telefone IS NOT NULL;

/* Seleciona o nome dos clientes do sexo feminino ou que possuem telefone */
SELECT nome, telefone
FROM cliente
WHERE sexo = 'F' OR telefone IS NOT NULL;

/* Selecione o nome dos clientes do sexo masculino */
SELECT nome
FROM cliente
WHERE sexo IN ('M');

/* Selecione os clientes que não são do sexo masculino */
SELECT nome
FROM cliente
WHERE sexo NOT IN ('M');

/* Selecione um valor x e y da tabela cliente */
SELECT produto, preco
FROM produto
WHERE preco BETWEEN 10,00 AND 20,99;

/* Selecione´, utilizando REGEXP o nome dos clientes que possuem a letra 'r' */
SELECT nome
FROM cliente
WHERE nome REGEXP 'r'; /* REGEXP -> Expressão regular */
-- WHERE nome REGEXP '^r';
-- WHERE nome REGEXP 'r$'; 
-- WHERE nome REGEXP '^r|^a';
-- WHERE nome REGEXP '[mr]a';
-- WHERE nome REGEXP '^[mr]a';

/* Operadores aritméticos */
/* +, -, *, /, % */
SELECT nome, salario, salario * 1.1 AS "Salário com aumento de 10%"
FROM funcionario;

/* Range de valores
int -> -2147483648 a 2147483647 (4 bytes) valor máximo 4294967295 2^32-1
bigint -> -9223372036854775808 a 9223372036854775807 (8 bytes) valor máximo 18446744073709551615 2^64-1
*/

-----------------------------------------------------------
-- Editar - seção 7 mais alguns comandos basicos

/* Verificando os bancos de dados existentes*/
SHOW DATABASES;
/* Acessando um banco de dados */
USE teste;
/* Criando a tabela cliente */	
CREATE TABLE pessoa(
    id INT(11) auto_increment PRIMARY KEY,
    nome VARCHAR(30),
    sexo CHAR(1),
    cpf INT(11),
    telefone VARCHAR(30),
    endereco VARCHAR(100)    
);

/* INSERINDO DADOS NA TABELA */
INSERT INTO pessoa (nome,sexo,cpf,telefone,endereco) VALUES ('Ana', 'F', 313233521, "12345678", 'Av. Atlântica, 1004 - Copacabana - Rio de Janeiro - RJ');
INSERT INTO pessoa (nome,sexo,cpf,telefone,endereco) VALUES ('Carlos', 'M', 112233999, '99998888', 'Rua das Palmeiras, 1234 - Jardim Botânico - Curitiba - PR');
INSERT INTO pessoa (nome,sexo,cpf,telefone,endereco) VALUES ('Marta', 'F', 987654321, '99998888', 'Rua das Palmeiras, 1234 - Jardim Botânico - Curitiba - PR');
INSERT INTO pessoa (nome,sexo,cpf,telefone,endereco) VALUES ('Maria', 'F', 214748364, '90011001', 'Rua Presidente Vargas, 2398 - Centro - Belo Horizonte - MG'); 
INSERT INTO pessoa (nome,sexo,cpf,telefone,endereco) VALUES ('Irene', 'F', 113455789,'98874555', 'Rua quatro, 701 - Vila ISabel - Rio de Janeiro - RJ');

/* UPDATE - atualizando dados da tabela */
/* Atualizando o telefone do cliente que possui o cpf 123456789 */

UPDATE pessoa
SET telefone = '99999999'
WHERE cpf = 123456789;

SELECT * FROM cliente;

/* Excluindo um registro */
DELETE FROM cliente
WHERE cpf = 123456789;

SELECT * FROM cliente;

INSERT INTO cliente VALUES (NULL,'João', 'M', 988221122, '11111111', 'Av. Brasil, 1234 - Cidade Nova - Franca - SP');

/* adicionar outro telefone para o cliente João */
UPDATE pessoa
SET telefone = '99999999'
WHERE nome = 'João';

SELECT * FROM cliente;

UPDATE pessoa
SET telefone = '988221122 - 975561122'
WHERE nome = 'João';

SELECT * FROM cliente;