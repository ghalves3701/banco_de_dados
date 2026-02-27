use cadastro;
select nome, descricao, ano from cursos
where ano >2010
order by ano, nome;

select ano, nome, carga from cursos
where ano != 2010
order by ano, nome;

select nome, ano from cursos
where ano between 2014 and 2016
order by nome;

select nome, ano from cursos
where ano in (2014, 2016)
order by nome;