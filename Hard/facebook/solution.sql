

WITH active_june AS (
  SELECT DISTINCT user_id FROM user_actions 
  WHERE EXTRACT(YEAR FROM event_date)=2022
  AND EXTRACT(MONTH FROM event_date)=06
  AND event_type IN ('sign-in','like','comment')
), active_july AS (
  SELECT DISTINCT user_id FROM user_actions 
  WHERE EXTRACT(YEAR FROM event_date)=2022
  AND EXTRACT(MONTH FROM event_date)=07
  AND event_type IN ('sign-in','like','comment')
)

SELECT '7' AS mth, count(*) AS monthly_active_users FROM active_june ajun
INNER JOIN active_july ajul
ON ajun.user_id = ajul.user_id