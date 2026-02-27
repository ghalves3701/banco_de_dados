--Total de pedido com detalhes
select p.id_pedido, c.nome as cliente, p.status, v.total_pedido
from pedidos p
join clientes c on c.id_cliente = p.id_cliente
join vw_total_pedido v on v.id_pedido = p.id_pedido
order by v.total_pedido desc;
