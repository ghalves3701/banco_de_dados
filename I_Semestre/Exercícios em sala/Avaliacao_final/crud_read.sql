select c.id_cliente, c.nome, c.email_principal, e.cidade, e.estado
from clientes c
left join clientes_enderecos e on e.id_cliente = c.id_cliente
where e.estado = 'SP'
order by c.nome;
