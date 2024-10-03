with top10_category as (
     select Category, avg(Rating) as avg_rate, SUM(REPLACE(Installs, ',','')+ 0) as install_count
     from google.cleanedfile
     group by Category
     order by install_count DESC
     limit 10
) 
select Category, avg_rate
from top10_category
order by avg_rate DESC;



