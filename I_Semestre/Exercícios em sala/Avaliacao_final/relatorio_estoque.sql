--Estoque atual por produto
select pr.id_produto, pr.nome, e.estoque_disponivel
from produtos pr
left join vw_estoque_produto e on e.id_produto = pr.id_produto
order by e.estoque_disponivel asc, pr.nome;