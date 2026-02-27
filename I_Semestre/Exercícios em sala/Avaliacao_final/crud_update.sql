update produtos
set preco_base = preco_base * 1.05
where id_categoria in (select id_categoria from categorias where nome ilike '%Moda%');
