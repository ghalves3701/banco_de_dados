use cadastro;
insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Godofredo', '1984-01-02', 'M', '78.5', '1.83', 'Brasil');

insert into pessoas
(nome, nascimento, sexo, peso, altura)
values
('Maria', '1999-12-30', 'F', '60.30', '1.60');

insert into pessoas values
(default, 'Maria', '1999-12-30', 'F', '60.30', '1.60', default);

insert into pessoas values
(default, 'Claudio', '1989-12-30', 'M', '80.30', '1.70', default),
(default, 'Gabriela', '1993-07-02', 'F', '63.02', '1.69', default),
(default, 'Gustavo', '1993-09-05', 'M', '88.7', '1.80', default);

select * from pessoas;