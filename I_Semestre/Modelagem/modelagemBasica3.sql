/* Alterando banco de dados*/

/* Verificando os bancos de dados existentes*/
SHOW DATABASES;
/* Acessando um banco de dados */
USE veterinaria;

/* Exluindo a tabela pessoa */
DROP TABLE pessoa;

/* Criando a tabela pessoa */
CREATE TABLE pessoa(
    id_pessoa INT auto_increment PRIMARY KEY,
    nome VARCHAR(30),
    genero CHAR(1),
    cpf VARCHAR(11) unique    
);
/* Criando a tabela telefone */
CREATE TABLE telefone(
    id_telefone INT auto_increment PRIMARY KEY,
    id_pessoa INT,
    tipo VARCHAR(20),
    numero VARCHAR(12),
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)  
);
/* Criando a tabela endereco */
CREATE TABLE endereco(
    id_endereco INT auto_increment PRIMARY KEY,
    id_pessoa INT,
    logradouro VARCHAR(100),
    numero INT,
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado CHAR(2),
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)    
);

/* Verificando as tabelas do banco de dados */
SHOW TABLES;
/* Verificando a estrutura de uma tabela */
DESC pessoa;  /* desc -> Describe –> descrever */

/* INSERINDO DADOS NA TABELA */
INSERT INTO pessoa (nome,genero,cpf) VALUES ('Ana', 'F', '31323352111');
INSERT INTO pessoa (nome,genero,cpf) VALUES ('Carlos', 'M', '11223399911');
INSERT INTO pessoa (nome,genero,cpf) VALUES ('Marta', 'F', '98765432111');
INSERT INTO pessoa (nome,genero,cpf) VALUES ('Maria', 'F', '21474836411');
INSERT INTO pessoa (nome,genero,cpf) VALUES ('Irene', 'F', '11345578911');
INSERT INTO pessoa (nome,genero,cpf) VALUES ('José', 'M', '45678912311');
INSERT INTO pessoa (nome,genero,cpf) VALUES ('Rosa', 'F', '45645678911');
INSERT INTO pessoa (nome,genero,cpf) VALUES ('João', 'M', '12345678911');
INSERT INTO pessoa (nome,genero,cpf) VALUES ('Maria', 'F', '12345670011');
INSERT INTO pessoa (nome,genero,cpf) VALUES ('Pedro', 'M', '11122334455');

SELECT * FROM pessoa;

/* INSERINDO DADOS NA TABELA telefone */
INSERT INTO telefone (id_pessoa,tipo,numero) VALUES (1, 'Residencial', '333336789');
INSERT INTO telefone (id_pessoa,tipo,numero) VALUES (2, 'Celular', '999998888');
INSERT INTO telefone (id_pessoa,tipo,numero) VALUES (3, 'Celular', '999992228');
INSERT INTO telefone (id_pessoa,tipo,numero) VALUES (4, 'Celular', '990011001');
INSERT INTO telefone (id_pessoa,tipo,numero) VALUES (5, 'Celular', '998874555');
INSERT INTO telefone (id_pessoa,tipo,numero) VALUES (6, 'Comercial', '333331111');
INSERT INTO telefone (id_pessoa,tipo,numero) VALUES (7, 'Celular', '999998811');
INSERT INTO telefone (id_pessoa,tipo,numero) VALUES (6, 'Celular', '999997777');
INSERT INTO telefone (id_pessoa,tipo,numero) VALUES (8, 'Celular', '999997700');
INSERT INTO telefone (id_pessoa,tipo,numero) VALUES (9, 'Residencial', '333335678');
INSERT INTO telefone (id_pessoa,tipo,numero) VALUES (10, 'Celular', '999988811');

SELECT * FROM telefone;

/* INSERINDO DADOS NA TABELA endereco */
INSERT INTO endereco (id_pessoa,logradouro,numero,bairro,cidade,estado) VALUES (1, 'Av. Atlântica', 1004, 'Copacabana', 'Rio de Janeiro', 'RJ');
INSERT INTO endereco (id_pessoa,logradouro,numero,bairro,cidade,estado) VALUES (2, 'Rua das Palmeiras', 1234, 'Jardim Botânico', 'Curitiba', 'PR');
INSERT INTO endereco (id_pessoa,logradouro,numero,bairro,cidade,estado) VALUES (3, 'Rua das Palmeiras', 1234, 'Jardim Botânico', 'Curitiba', 'PR');
INSERT INTO endereco (id_pessoa,logradouro,numero,bairro,cidade,estado) VALUES (4, 'Rua Presidente Vargas', 2398, 'Centro', 'Belo Horizonte', 'MG');
INSERT INTO endereco (id_pessoa,logradouro,numero,bairro,cidade,estado) VALUES (5, 'Rua quatro', 701, 'Vila ISabel', 'Rio de Janeiro', 'RJ');
INSERT INTO endereco (id_pessoa,logradouro,numero,bairro,cidade,estado) VALUES (6, 'Av. América', 1456, 'Jardim América', 'Belo Horizonte', 'MG');
INSERT INTO endereco (id_pessoa,logradouro,numero,bairro,cidade,estado) VALUES (7, 'Rua José João', 5776, 'Cidade Alta', 'Salvador', 'BA');
INSERT INTO endereco (id_pessoa,logradouro,numero,bairro,cidade,estado) VALUES (8, 'Av. Brasil', 1234, 'Cidade Nova', 'Franca', 'SP');
INSERT INTO endereco (id_pessoa,logradouro,numero,bairro,cidade,estado) VALUES (9, 'Rua José da Silva', 5033, 'Centro', 'Franca', 'SP');
INSERT INTO endereco (id_pessoa,logradouro,numero,bairro,cidade,estado) VALUES (10, 'Av. Atlântica', 1004, 'Copacabana', 'Rio de Janeiro', 'RJ');

SELECT * FROM endereco;

/* Selecionando dados das tabelas */

SELECT nome, cpf
FROM pessoa
WHERE genero = 'F';

SELECT numero
FROM telefone
WHERE tipo = 'Celular';

SELECT logradouro, numero, bairro, cidade, estado
FROM endereco
WHERE estado = 'RJ';

/* Função inner join */
SELECT 
pessoa.nome AS pessoa-nome, 
endereco.logradouro AS endereco-logradouro, 
endereco.numero AS endereco-numero, 
endereco.bairro AS endereco-bairro, 
endereco.cidade AS endereco-cidade, 
endereco.estado AS endereco-estado
FROM pessoa
INNER JOIN endereco ON pessoa.id_pessoa = endereco.id_pessoa;

SELECT 
pessoa.nome AS pessoa-nome, 
endereco.logradouro, 
endereco.numero, 
endereco.bairro, 
endereco.cidade, 
endereco.estado
FROM pessoa
INNER JOIN endereco ON pessoa.id_pessoa = endereco.id_pessoa;
/* utilizando alias */
SELECT p.nome, e.logradouro, e.numero, e.bairro, e.cidade, e.estado
FROM pessoa p
INNER JOIN endereco e ON p.id_pessoa = e.id_pessoa;

/* Selecionar o nome, tipo de telefone, numero do telefone, logradouro, numero, bairro, cidade e estado */
SELECT p.nome, t.tipo, t.numero, e.logradouro, e.numero, e.bairro, e.cidade, e.estado
FROM pessoa p
INNER JOIN telefone t ON p.id_pessoa = t.id_pessoa
INNER JOIN endereco e ON p.id_pessoa = e.id_pessoa;

/* Selecionar o nome, tipo de telefone, numero do telefone, logradouro, numero, bairro, cidade e estado dos cliente do genero feminino */
SELECT p.nome, t.tipo, t.numero, e.logradouro, e.numero, e.bairro, e.cidade, e.estado
FROM pessoa p
INNER JOIN telefone t ON p.id_pessoa = t.id_pessoa
INNER JOIN endereco e ON p.id_pessoa = e.id_pessoa
WHERE p.genero = 'F';

/* Selecionar os dados de toda tabela da esquerda e os dados da tabela da direita que tem correspondência */
SELECT p.nome, p.cpf, t.tipo, t.numero
FROM pessoa p
LEFT JOIN telefone t ON p.id_pessoa = t.id_pessoa;

/* Selecionar os dados de toda tabela da direita e os dados da tabela da esquerda que tem correspondência */
SELECT p.nome, p.cpf, t.tipo, t.numero
FROM pessoa p
RIGHT JOIN telefone t ON p.id_pessoa = t.id_pessoa;

/* Inserindo dados nas tabelas */
/* Insere uma pessoa, telefone e endereço ao mesmo tempo */
START TRANSACTION;
INSERT INTO pessoa (nome, genero, cpf) VALUES ('Pedro', 'M', '31300002111');
SET @id_pessoa = LAST_INSERT_ID();
INSERT INTO telefone (id_pessoa,tipo,numero) VALUES (@id_pessoa, 'Celular', '977775555');
INSERT INTO endereco (id_pessoa, logradouro, numero, bairro, cidade, estado) VALUES (@id_pessoa, 'Rua Sao Paulo', 1234, 'Cidade Nova', 'Franca', 'SP');
COMMIT;

/* Insere uma pessoa, endereço sem telefone */
START TRANSACTION;
INSERT INTO pessoa (nome, genero, cpf) VALUES ('Luiza', 'F', '55577733311');
SET @id_pessoa = LAST_INSERT_ID();
INSERT INTO endereco (id_pessoa, logradouro, numero, bairro, cidade, estado) VALUES (@id_pessoa, 'Rua 23', 5055, 'Centro', 'Cuiaba', 'MT');
COMMIT;

/************** explicação **************/

START TRANSACTION;
Inicia uma transação no banco de dados. Isso significa que todas as operações executadas a partir deste ponto estarão dentro da transação, e não serão confirmadas (salvas) até que o comando COMMIT; seja executado. Se houver um problema, a transação pode ser revertida usando ROLLBACK;, garantindo a integridade dos dados.

INSERT INTO pessoa (nome,genero,cpf) VALUES ('Sandro', 'M', '11111111100');
Esse comando insere um novo registro na tabela cliente com os dados especificados:

nome: 'Sandro'
sexo: 'M' (Masculino)
cpf: '11111111100'
SET @id_pessoa = LAST_INSERT_ID();
Armazena o ID (chave primária) do último registro inserido na tabela pessoa na variável @id_pessoa. LAST_INSERT_ID() retorna o valor do campo id_pessoa do último INSERT, que é importante para garantir que as próximas inserções nas tabelas relacionadas estejam associadas a essa pessoa.

INSERT INTO telefone (id_pessoa, tipo, numero) VALUES (@id_pessoa, 'Celular', '977775555');
Insere um registro na tabela telefone, também associado a pessoa criada, com as informações:

tipo: 'Celular'
numero: '977775555'

INSERT INTO endereco (id_pessoa, logradouro, numero, bairro, cidade, estado) VALUES (@id_pessoa, 'Rua Sao Paulo', 1234, 'Cidade Nova', 'Franca', 'SP');
Insere um registro na tabela endereco, associando-o a pessoa recém-criada (referenciado pelo @id_pessoa), com os seguintes dados:

rua: 'Rua Sao Paulo'
numero: 1234
bairro: 'Cidade Nova'
cidade: 'Franca'
estado: 'SP'

COMMIT;
Finaliza a transação e confirma todas as operações realizadas dentro dela. A partir deste ponto, as inserções feitas nas tabelas pessoa, endereco e telefone são salvas permanentemente no banco de dados.

Resumo:
Esse código:

Cria um cliente com dados básicos.
Recupera o ID da pessoa criada e usa-a para associar registros nas tabelas endereco e telefone.
Garante que, se todas as operações forem bem-sucedidas, as mudanças sejam confirmadas com COMMIT.

/* Atualizando dados nas tabelas */
UPDATE pessoa
SET t.numero = '333339999'
FROM telefone t
INNER JOIN pessoa p ON t.id_pessoa = p.id_pessoa
WHERE p.cpf = '31323352111';

/* Inserindo telefone para o cliente 'Ana' */
INSERT INTO telefone (id_pessoa, tipo, numero)
VALUES (
    (SELECT id_pessoa FROM pessoa WHERE cpf = '31323352111'),
    'Celular',
    '999998888'
);

/* Excluindo dados nas tabelas do cliente com cpf 31323352111 */
DELETE FROM pessoa
WHERE cpf = '31323352111';



INSERT INTO telefone (id_pessoa,tipo,numero) 
VALUES (
    (SELECT id_pessoa FROM pessoa WHERE cpf = '98765432111'), 
    'Residencial', 
    '333336789');