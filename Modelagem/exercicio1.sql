/****** EXERCÍCIO DE FIXAÇÃO 1 ******/

/* O cliente solicitou que fosse criado um banco de dados para armazenar os dados dos livros vendidos em sua livraria. Crie um banco de dados chamado livraria e uma tabela chamada livro com os seguintes campos: titulo, autor, sexo, paginas, editora, preco, estado e ano. */

CREATE DATABASE livraria;

USE livraria;

CREATE TABLE livro(
    id INT(11) auto_increment PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    sexo CHAR(1),
    paginas INT,
    editora VARCHAR(100),
    preco DECIMAL(10,2),
    estado CHAR(2),
    ano INT
);
/* Inserindo registros na tabela livro */
INSERT INTO livro (titulo, autor, sexo, paginas, editora, preco, estado, ano) VALUES
('Orgulho e Preconceito', 'Jane Austen', 'F', 432, 'Penguin Books', 39.90, 'SP', 1813),
('O Morro dos Ventos Uivantes', 'Emily Brontë', 'F', 416, 'Editora Zahar', 45.00, 'RJ', 1847),
('Anna Kariênina', 'Liev Tolstói', 'M', 864, 'Editora 34', 74.90, 'SP', 1877),
('Dom Casmurro', 'Machado de Assis', 'M', 256, 'Editora Ática', 29.50, 'RJ', 1899),
('Razão e Sensibilidade', 'Jane Austen', 'F', 416, 'Martin Claret', 36.80, 'MG', 1811),
('O Amor nos Tempos do Cólera', 'Gabriel García Márquez', 'M', 448, 'Record', 49.90, 'BA', 1985),
('Madame Bovary', 'Gustave Flaubert', 'M', 432, 'Martin Claret', 42.50, 'PR', 1857),
('Jane Eyre', 'Charlotte Brontë', 'F', 592, 'Editora Zahar', 54.90, 'SP', 1847),
('A Montanha Mágica', 'Thomas Mann', 'M', 928, 'Companhia das Letras', 69.80, 'RS', 1924),
('O Primo Basílio', 'Eça de Queirós', 'M', 528, 'Principis', 32.90, 'RJ', 1878),
('O Senhor dos Anéis', 'J. R. R. Tolkien', 'M', 1000, 'Martins Fontes', 100.00, 'SP', 1954),
('O Hobbit', 'J. R. R. Tolkien', 'M', 300, 'Martins Fontes', 50.00, 'SP', 1937),
('O Silmarillion', 'J. R. R. Tolkien', 'M', 500, 'Martins Fontes', 70.00, 'SP', 1977),
('O Código da Vinci', 'Dan Brown', 'M', 500, 'Arqueiro', 60.00, 'SP', 2003);

/* 1. Selecione todos os campos*/

/* 2. Selecione o título e a editora */

/* 3. Selecione o título e a UF dos livros publicados por autores do sexo masculino */

/* 4. Selecione o título e o numero de paginas dos livros publicados por autores do sexo feminino */

/* 5. Selecione o título dos livros das editoras de SP */

/* 6. Selecione o título e o ano dos livros publicados por autores do sexo masculino e que tenham mais de 500 páginas */

/* 7. Selecione o título dos livros, dos autores do sexo feminino, publicados nos estados de SP e RJ */

/* 8. Selecione os títulos dos livros publicados nos estados de SP e RJ e que tenham sido publicados antes de 1900 */

/* 9. Selecione, utilizando "IN" os títulos dos livros publicados nos estados de SP e RJ */

/* 10. Selecione os títulos dos livros que possuem o preço entre 30 e 50 reais, ordenados pelo preço */

/* 11. Traga a quantidade de autores por sexo */
