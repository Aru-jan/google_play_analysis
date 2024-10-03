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

