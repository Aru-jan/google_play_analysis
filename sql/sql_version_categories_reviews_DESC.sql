use gp_1;

show tables;

select Category,SUM(Reviews) as total_reviews
from reviews
group by Category
order by total_reviews DESC
LIMIT 12;
# is equivalent to (in pandas):
# grouped_df = merged_df[['Category', 'Reviews']].groupby('Category').sum().sort_values(by='Reviews', ascending=False)
