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
INSERT INTO pessoa (nome,sexo,cpf,telefone,endereco) VALUES ('Ana', 'F', 313233521, '12345678', 'Av. Atlântica, 1004 - Copacabana - Rio de Janeiro - RJ');
INSERT INTO pessoa (nome,sexo,cpf,telefone,endereco) VALUES ('Carlos', 'M', 112233999, '99998888', 'Rua das Palmeiras, 1234 - Jardim Botânico - Curitiba - PR');
INSERT INTO pessoa (nome,sexo,cpf,telefone,endereco) VALUES ('Marta', 'F', 987654321, '99998888', 'Rua das Palmeiras, 1234 - Jardim Botânico - Curitiba - PR');
INSERT INTO pessoa (nome,sexo,cpf,telefone,endereco) VALUES ('Maria', 'F', 214748364, '90011001', 'Rua Presidente Vargas, 2398 - Centro - Belo Horizonte - MG'); 
INSERT INTO pessoa (nome,sexo,cpf,telefone,endereco) VALUES ('Irene', 'F', 113455789,'98874555', 'Rua quatro, 701 - Vila ISabel - Rio de Janeiro - RJ');
INSERT INTO pessoa (nome,sexo,cpf,telefone,endereco) VALUES ('Joao', 'M', 123456789 , '988221122', 'Av. Brasil, 1234 - Cidade Nova - Franca - SP');

/* UPDATE - atualizando dados da tabela */
/* Atualizando o telefone do cliente que possui o cpf 123456789 */

UPDATE pessoa
SET telefone = '999999999'
WHERE cpf = 123456789;

SELECT * FROM pessoa;
SELECT nome, telefone FROM pessoa;

/* Excluindo um registro */
DELETE FROM pessoa
WHERE cpf = 123456789;

SELECT * FROM cliente;

INSERT INTO pessoa (nome,sexo,cpf,telefone,endereco) VALUES ('Joao', 'M', 123456789 , '988221122', 'Av. Brasil, 1234 - Cidade Nova - Franca - SP');

/* ALTERANDO O NOME DE UMA COLUNA - CHANGE */
/* ALTER TABLE */

ALTER TABLE pessoa
CHANGE cpf documento INT(11) NOT NULL;

DESC pessoa;

/* ALTERANDO O TIPO DE DADOS DE UMA COLUNA */
/* MODIFY */

ALTER TABLE pessoa
MODIFY documento VARCHAR(11) NOT NULL;

DESC pessoa;

/* ADICIONANDO UMA NOVA COLUNA */
/* ADD */

ALTER TABLE pessoa
ADD descricao VARCHAR(100);

DESC pessoa;

UPDATE pessoa
SET descricao = 'Cliente VIP'
WHERE documento = 988221122;

SELECT * FROM pessoa;

/* REMOVENDO UMA COLUNA */
/* DROP */

ALTER TABLE pessoa
DROP COLUMN descricao;

DESC pessoa;

/* ADICIONANDO UMA COLUNA EM UMA POSIÇÃO ESPECÍFICA */
/* AFTER - FIRST */

ALTER TABLE pessoa
ADD email VARCHAR(100)
FIRST;

DESC pessoa;

ALTER TABLE pessoa
DROP COLUMN email;

ALTER TABLE pessoa
ADD email VARCHAR(100) 
AFTER telefone;

DESC pessoa;

/* ALTERANDO O NOME DE UMA TABELA */
/* RENAME */

ALTER TABLE pessoa
RENAME TO cliente;

DESC cliente;

/* Excluindo a tabela cliente */
DROP TABLE cliente;

SHOW TABLES;

/* Excluindo o banco de dados teste */
DROP DATABASE teste;

SHOW DATABASES;

