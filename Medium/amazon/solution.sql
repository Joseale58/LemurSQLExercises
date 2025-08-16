WITH SUMA AS (SELECT category, product, SUM(spend) AS total_sum
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date)=2022
GROUP BY product, category ),
RANKING_BY_CATEGORY AS(
SELECT *, ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_sum DESC)
FROM SUMA)
SELECT category, product, total_sum AS total_spend FROM RANKING_BY_CATEGORY WHERE row_number < 3