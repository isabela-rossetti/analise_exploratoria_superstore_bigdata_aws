select "sub-category" as Sub_Categoria, round(sum(sales),2) as Soma_Vendas
from superstore
group by "sub-category"
order by "sub-category";