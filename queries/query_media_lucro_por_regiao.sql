select region as Regiao, (avg(profit),2) as Media_Lucro
from superstore 
group by region
order by region;