use cadastro;
alter table pessoas
add column profissao varchar(10);

desc pessoas;

alter table pessoas
drop column profissao;

alter table pessoas
add column profissao varchar(10) after nome;

alter table pessoas
add codigo int first;

alter table pessoas
drop codigo;

alter table pessoas
modify column profissao varchar(20) not null default '';

alter table pessoas
modify column profissao varchar(20);

alter table pessoas
change column profissao prof varchar(20);

alter table pessoas
rename to gafanhotos;

create table if not exists cursos(
nome  varchar (30) not  null,
descricao text,
carga int unsigned,
totaualas int,
ano year default '2026'

) default charset = utf8mb4; 


alter table cursos 
add id_curso int first;     /*primeiro adiciona a coluna*/

alter table cursos
add primary key (id_curso);      /*depois adiciona como chave primária*/
