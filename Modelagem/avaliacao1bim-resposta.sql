/*
Avaliação 1º Bimestre - Modelagem de Banco de Dados
A avaliação deve ser feita em papel e escrita a mão. O aluno deve transcrever as respostas, tirar foto e enviar em PDF via TEAMS.
Deve ser escrito somente o código SQL, sem os resultados das consultas.
Não é preciso reescrever o enunciado das questões, apenas o número da questão.
*/

CREATE DATABASE IF NOT EXISTS industria;
USE industria;
CREATE TABLE IF NOT EXISTS pessoa (
    id_pessoa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    sexo ENUM('M', 'F') NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO pessoa (nome, cpf, sexo, data_nascimento, telefone, email) VALUES
('João Silva', '123.456.789-00', 'M', '1985-06-15', '(11) 91234-5678','joaosilva@email.com');
INSERT INTO pessoa (nome, cpf, sexo, data_nascimento, telefone, email) VALUES
('Maria Oliveira', '987.654.321-00', 'F', '1992-08-22', '(21) 99876-5432', 'mariaoliveira@email.com');
INSERT INTO pessoa (nome, cpf, sexo, data_nascimento, telefone, email) VALUES
('Carlos Souza', '111.222.333-44', 'M', '1978-11-30', '(31) 93456-7890', 'carlossouza@email.com');
INSERT INTO pessoa (nome, cpf, sexo, data_nascimento, telefone, email) VALUES
('Ana Pereira', '555.666.777-88', 'F', '2000-01-10', '(41) 91234-5678','anapereira@email.com');

/* 1. Listar o nome e o número de telefone de todas as pessoas */
SELECT nome, telefone
FROM pessoa;

/* 2. Listar o nome e a data de nascimento todas as pessoas do sexo feminino */
SELECT p.nome, p.data_nascimento
FROM pessoa p
WHERE p.sexo = 'F';

/* 3. Listar o nome e o email de todas as pessoas que nasceram após 1990 */
SELECT p.nome, p.email
FROM pessoa p
WHERE p.data_nascimento > '1990-12-31';

/* 4. Listar o nome e o email de todas as pessoas que possuem 'silva' no nome */
SELECT p.nome, p.email
FROM pessoa p
WHERE p.nome LIKE '%silva%';

/* 5. Listar o nome, a data de nascimento e o email de todas as pessoas, ordenado por data de nascimento */
SELECT p.nome, p.data_nascimento, p.email
FROM pessoa p
ORDER BY p.data_nascimento;

/* 6. Atualizar o telefone da pessoa com CPF '123.456.789-00' para '(11) 99999-9999' */
UPDATE pessoa
SET telefone = '(11) 99999-9999'
WHERE cpf = '123.456.789-00';

/* 7. Deletar a pessoa com CPF '987.654.321-00' */
DELETE FROM pessoa
WHERE cpf = '987.654.321-00';

/* 8. Inserir na tabela uma nova pessoa de nome Ana Silva, CPF 111.222.333-44, sexo F, a data de nascimento é 1995-05-15, os contatos são: telefone (21) 98888-7777 e email anasilva@email.com. */
INSERT INTO pessoa (nome, cpf, sexo, data_nascimento, telefone, email)
VALUES ('Ana Silva', '111.222.333-44', 'F', '1995-05-15', '(21) 98888-7777', 'anasilva@email.com');

/* 9. Contar o número total de pessoas na tabela */
SELECT COUNT(*) AS total_pessoas
FROM pessoa;

/* 10. Contar o número de pessoas do sexo masculino e feminino */
SELECT p.sexo, COUNT(*) AS total
FROM pessoa p
GROUP BY p.sexo;

/* 11. Fazer o modelo conceitual do banco de dados */
/* (Modelo conceitual já implementado na criação da tabela acima) *


