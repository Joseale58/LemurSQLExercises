WITH counts_per_user AS (
  SELECT user_id, count(*) FROM tweets 
  WHERE EXTRACT(YEAR FROM tweet_Date) = 2022 GROUP BY user_id
)
SELECT count AS tweet_bucket, count(*) AS users_num FROM counts_per_user
GROUP BY count;