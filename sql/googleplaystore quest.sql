USE googleplaystore;
SELECT * FROM googleplaystore;

-- top 10 apps:
SELECT App, SUM(Installs) AS total_installs
FROM df_1
GROUP BY App
ORDER BY total_installs DESC
LIMIT 10;

-- Total installs per category:
SELECT category, SUM(installs) as total_installs
FROM df_1
GROUP BY category
ORDER BY total_installs DESC
LIMIT 10;

-- Average Rating by category:
SELECT category, SUM(rating) AS total_rating
FROM df_1
GROUP BY category
ORDER BY total_rating DESC
LIMIT 10;

-- Top 15 categories by number of reviews:
SELECT category, SUM(reviews) AS total_reviews
FROM googleplaystore
GROUP BY category
ORDER BY total_reviews DESC
LIMIT 15;

-- Content rating distribution accross categories:
SELECT category, rating, COUNT(*) AS total_rating
FROM df_1
GROUP BY category, rating
ORDER BY category, total_rating DESC;

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

-- categories , reviews
select Category,SUM(Reviews) as total_reviews
from reviews
group by Category
order by total_reviews DESC
LIMIT 12;
# is equivalent to (in pandas):
# grouped_df = merged_df[['Category', 'Reviews']].groupby('Category').sum().sort_values(by='Reviews', ascending=False)

