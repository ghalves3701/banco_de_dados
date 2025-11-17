/****** EXERCÍCIO 4 ******/

/* ACESSAR O BANCO DE DADOS LIVRARIA CRIADO EM modelagemBasica4.sql*/

USE veterinaria;
/* Criando a tabela pessoa */
CREATE TABLE pessoa(
    id_pessoa INT auto_increment PRIMARY KEY,
    nome VARCHAR(50),
    cpf VARCHAR(11),
    telefone VARCHAR(11),
    email VARCHAR(50)
);

/* Criando a tabela funcionario */
CREATE TABLE funcionario(
    id_funcionario INT auto_increment PRIMARY KEY,
    id_pessoa INT,
    salario DECIMAL(10,2),
    cargo VARCHAR(30),
    data_admissao DATE,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

/* Criando a tabela veterinario */
CREATE TABLE veterinario(
    id_veterinario INT auto_increment PRIMARY KEY,
    id_funcionario INT,
    crmv VARCHAR(10),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

/* Criando a tabela cliente */
CREATE TABLE cliente(
    id_cliente INT auto_increment PRIMARY KEY,
    id_pessoa INT,
    pontos INT,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

/* Criando a tabela animal */
CREATE TABLE animal(
    id_animal INT auto_increment PRIMARY KEY,
    id_cliente INT,
    nome VARCHAR(30),
    especie VARCHAR(30),
    raca VARCHAR(30),
    idade INT,
    peso DECIMAL(5,2),    
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)    
);

/* Criando a tabela meidicamento */
CREATE TABLE medicamento(
    id_medicamento INT auto_increment PRIMARY KEY,
    nome VARCHAR(30),
    descricao VARCHAR(100),
    preco DECIMAL(10,2)
);

/* Criando a tabela consulta */
CREATE TABLE consulta(
    id_consulta INT auto_increment PRIMARY KEY,
    id_veterinario INT,
    id_cliente INT,
    id_animal INT,
    id_medicamento INT,
    data_consulta DATE,
    diagnostico VARCHAR(100),    
    FOREIGN KEY (id_veterinario) REFERENCES veterinario(id_veterinario),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_animal) REFERENCES animal(id_animal),
    FOREIGN KEY (id_medicamento) REFERENCES medicamento(id_medicamento)
);

/* Verificando as tabelas do banco de dados */
SHOW TABLES;

INSERT INTO pessoa (id_pessoa, nome, cpf, telefone, email) VALUES
(1, 'João Silva', '12345678901', '11987654321', 'joao.silva@email.com'),
(2, 'Maria Oliveira', '23456789012', '21987654322', 'maria.oliveira@email.com'),
(3, 'Carlos Souza', '34567890123', '31987654323', 'carlos.souza@email.com'),
(4, 'Ana Costa', '45678901234', '41987654324', 'ana.costa@email.com'),
(5, 'Pedro Rocha', '56789012345', '51987654325', 'pedro.rocha@email.com'),
(6, 'Fernanda Lima', '67890123456', '61987654326', 'fernanda.lima@email.com'),
(7, 'Ricardo Alves', '78901234567', '71987654327', 'ricardo.alves@email.com'),
(8, 'Juliana Santos', '89012345678', '81987654328', 'juliana.santos@email.com'),
(9, 'Marcos Pereira', '90123456789', '91987654329', 'marcos.pereira@email.com'),
(10, 'Patrícia Rocha', '01234567890', '11987654330', 'patricia.rocha@email.com');

INSERT INTO funcionario (id_pessoa, salario, cargo, data_admissao) VALUES
(1, 5000.00, 'Veterinário', '2020-01-15'),
(2, 4500.00, 'Recepcionista', '2019-03-10'),
(3, 5500.00, 'Veterinário', '2021-05-20'),
(4, 4800.00, 'Atendente', '2022-07-25'),
(5, 6000.00, 'Gerente', '2018-11-30');

INSERT INTO veterinario (id_funcionario, crmv) VALUES
(1, 'CRM12345'),
(3, 'CRM67890');

INSERT INTO cliente (id_pessoa, pontos) VALUES
(1, 250),
(2, 100),
(3, 300),
(4, 50),
(5, 200),
(6, 150),
(7, 75),
(8, 300),
(9, 90),
(10, 120);

INSERT INTO animal (id_cliente, nome, especie, raca, idade, peso) VALUES
(1, 'Rex', 'Cachorro', 'Labrador', 5, 30.50),
(2, 'Mimi', 'Gato', 'Siamês', 3, 4.20),
(3, 'Thor', 'Cachorro', 'Bulldog', 2, 25.00),
(1, 'Luna', 'Cachorro', 'Poodle', 4, 8.00),
(2, 'Bela', 'Gato', 'Persa', 1, 3.80),
(4, 'Max', 'Cachorro', 'Golden Retriever', 6, 32.00),
(5, 'Nina', 'Gato', 'Maine Coon', 2, 5.50),
(6, 'Bolt', 'Cachorro', 'Beagle', 3, 12.00),
(7, 'Lola', 'Gato', 'Sphynx', 1, 3.20),
(8, 'Rex', 'Cachorro', 'Pastor Alemão', 4, 35.00),
(9, 'Mel', 'Gato', 'Angorá', 5, 4.80),
(10, 'Bob', 'Cachorro', 'Bulldog Francês', 2, 10.50);

INSERT INTO medicamento (nome, descricao, preco) VALUES
('Antibiótico X', 'Antibiótico para infecções bacterianas', 50.00),
('Anti-inflamatório Y', 'Anti-inflamatório para dores e inflamações', 30.00),
('Vermífugo Z', 'Vermífugo para tratamento de parasitas internos', 25.00),
('Analgésico A', 'Analgésico para alívio de dores', 20.00),
('Suplemento B', 'Suplemento vitamínico para animais', 40.00);

INSERT INTO consulta (id_veterinario, id_cliente, id_animal, id_medicamento, data_consulta, diagnostico) VALUES
(1, 1, 1, 1, '2023-10-01', 'Infecção bacteriana tratada com Antibiótico X'),
(2, 2, 2, 2, '2023-10-02', 'Inflamação tratada com Anti-inflamatório Y'),
(1, 3, 3, 3, '2023-10-03', 'Parasitas internos tratados com Vermífugo Z'),
(2, 1, 4, 4, '2023-10-04', 'Dor tratada com Analgésico A'),
(1, 2, 5, 5, '2023-10-05', 'Suplementação vitamínica recomendada'),
(1, 4, 6, 2, '2023-10-06', 'Inflamação tratada com Anti-inflamatório Y'),
(2, 5, 7, 3, '2023-10-07', 'Parasitas internos tratados com Vermífugo Z'),
(1, 6, 8, 4, '2023-10-08', 'Dor tratada com Analgésico A'),
(2, 7, 9, 5, '2023-10-09', 'Suplementação vitamínica recomendada'),
(1, 8, 10, 1, '2023-10-10', 'Infecção bacteriana tratada com Antibiótico X'),
(2, 9, 11, 2, '2023-10-11', 'Inflamação tratada com Anti-inflamatório Y'),
(1, 10, 12, 3, '2023-10-12', 'Parasitas internos tratados com Vermífugo Z');

/* Verificando os registros das tabelas */
SELECT * FROM pessoa;
SELECT * FROM funcionario;
SELECT * FROM veterinario;
SELECT * FROM cliente;
SELECT * FROM animal;
SELECT * FROM medicamento;
SELECT * FROM consulta;

/* 1- Selecione o nome, salário, cargo, data de admissão de todos funcionários, ordenados pelo cargo e pelo nome. */
SELECT pes.nome, fun.salario, fun.cargo, fun.data_admissao
FROM pessoa pes
JOIN funcionario fun ON pes.id_pessoa = fun.id_pessoa
ORDER BY fun.cargo, pes.nome;

/* 2- Selecione o nome, salário, data de admissão e o crmv dos veterinários */
SELECT pes.nome, fun.salario, fun.data_admissao, vet.crmv
FROM pessoa pes
JOIN funcionario fun ON pes.id_pessoa = fun.id_pessoa
JOIN veterinario vet ON fun.id_funcionario = vet.id_funcionario;


/* 3- Selecione o nome do cliene, o nome do pet e a raça de todos cachorros */
SELECT pes.nome, ani.nome, ani.raca
FROM pessoa pes
JOIN cliente cli ON pes.id_pessoa = cli.id_pessoa
JOIN animal ani ON cli.id_cliente = ani.id_cliente
WHERE ani.especie = 'Cachorro';

/* 4- Selecione o nome do cliente, o nome do pet e a idade de todos gatos */
SELECT pes.nome, ani.nome, ani.idade
FROM pessoa pes
JOIN cliente cli ON pes.id_pessoa = cli.id_pessoa
JOIN animal ani ON cli.id_cliente = ani.id_cliente
WHERE ani.especie = 'Gato';

/* 5- Selecione o nome de todos os funcionários que também são clientes */
SELECT pessoa.nome
FROM pessoa
JOIN funcionario ON pessoa.id_pessoa = funcionario.id_pessoa
JOIN cliente ON pessoa.id_pessoa = cliente.id_pessoa;

SELECT pes.nome
FROM pessoa pes
JOIN funcionario fun ON pes.id_pessoa = fun.id_pessoa
JOIN cliente cli ON pes.id_pessoa = cli.id_pessoa;

/* 6- Selecioone o nome do cliente, o nome do pet, o nome do veterinario e a data da consulta de todos os clientes */
SELECT pes.nome, ani.nome, pes2.nome, con.data_consulta
FROM pessoa pes
JOIN cliente cli ON pes.id_pessoa = cli.id_pessoa
JOIN animal ani ON cli.id_cliente = ani.id_cliente
JOIN consulta con ON cli.id_cliente = con.id_cliente
JOIN veterinario vet ON con.id_veterinario = vet.id_veterinario
JOIN funcionario fun ON vet.id_funcionario = fun.id_funcionario
JOIN pessoa pes2 ON fun.id_pessoa = pes2.id_pessoa;

/* 7- Selecione o nome do cliente, o nome do pet, o nome do veterinario e a data da consulta de todos os clientes, ordenados pela data da consulta */
SELECT pes.nome, ani.nome, pes2.nome, con.data_consulta
FROM pessoa pes
JOIN cliente cli ON pes.id_pessoa = cli.id_pessoa
JOIN animal ani ON cli.id_cliente = ani.id_cliente
JOIN consulta con ON cli.id_cliente = con.id_cliente
JOIN veterinario vet ON con.id_veterinario = vet.id_veterinario
JOIN funcionario fun ON vet.id_funcionario = fun.id_funcionario
JOIN pessoa pes2 ON fun.id_pessoa = pes2.id_pessoa
ORDER BY con.data_consulta;

/* 8- Selecione o nome do veterinário, o nome do pet e a data da consulta realizada por ele, ordenados pelo nome do veterinário e pela data da consulta */
SELECT pes.nome, ani.nome, con.data_consulta
FROM pessoa pes
JOIN funcionario fun ON pes.id_pessoa = fun.id_pessoa
JOIN veterinario vet ON fun.id_funcionario = vet.id_funcionario
JOIN consulta con ON vet.id_veterinario = con.id_veterinario
JOIN animal ani ON con.id_animal = ani.id_animal
ORDER BY pes.nome, con.data_consulta;

/* 9- Selecione o nome do cliente, o nome do pet e a data da consulta de todos os clientes, ordenados pelo nome do cliente e pelo nome do pet */
SELECT pes.nome, ani.nome, con.data_consulta
FROM pessoa pes
JOIN cliente cli ON pes.id_pessoa = cli.id_pessoa
JOIN animal ani ON cli.id_cliente = ani.id_cliente
JOIN consulta con ON cli.id_cliente = con.id_cliente
ORDER BY pes.nome, ani.nome;

/* 10- Selecione o nome do animal, a espécie, a raça, a idade e o peso de todos os animais que utilizaram o medicamento Anti-inflamatório Y */
SELECT ani.nome, ani.especie, ani.raca, ani.idade, ani.peso
FROM animal ani
JOIN consulta con ON ani.id_animal = con.id_animal
JOIN medicamento med ON con.id_medicamento = med.id_medicamento
WHERE med.nome = 'Anti-inflamatório Y';

/* 11- Selecione o nome, pontos e o total de consultas de todos os clientes */
SELECT pes.nome, cli.pontos, COUNT(con.id_consulta) AS total_consultas
FROM pessoa pes
JOIN cliente cli ON pes.id_pessoa = cli.id_pessoa
LEFT JOIN consulta con ON cli.id_cliente = con.id_cliente
GROUP BY pes.nome, cli.pontos;
