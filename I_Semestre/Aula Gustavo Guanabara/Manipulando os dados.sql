insert into cursos values
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'),
('2', 'Algorítmos', 'Lógica de Programação', '20', '15', '2014'),
('3', 'Photoshop', 'dicas de Photoshop CC', '10', '8', '2014'), 
('4', 'PGP', 'Curso de PHP para iniciantes', '40','20','2010'),
('5', 'Jarva', 'introdução à linguagem Java', '10', '8', '2014'),
('6', 'MySQL', 'Banco de dados MySQL', '30', '15', '2016');
desc cursos;

select * from cursos;

update cursos
set nome = 'html5'
where id_curso = '1';

update cursos
set nome='PHP', ano = '2015'
where id_curso = '4';

update cursos
set nome='Java', carga='40', ano='2015'
where id_curso = '5'
limit 1;

delete from cursos 
where nome = 'MySQL' ;

