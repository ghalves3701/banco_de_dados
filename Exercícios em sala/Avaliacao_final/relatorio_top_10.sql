--Top 10 produtos mais vendidos por quantidade
select pr.id_produto, pr.nome, sum(i.quantidade) as qtd_total
from itens_pedido i
join produtos pr on pr.id_produto = i.id_produto
group by pr.id_produto, pr.nome
order by qtd_total desc
limit 10;
