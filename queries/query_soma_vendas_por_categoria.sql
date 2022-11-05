select category as Categoria, round(sum(sales),2) as Soma_Vendas
from superstore
group by category
order by category;