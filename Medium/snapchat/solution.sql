WITH times AS (
SELECT user_id,
      SUM(CASE WHEN activity_type = 'send' THEN time_spent END) AS time_spent_sending,
      SUM(CASE WHEN activity_type = 'open' THEN time_spent END) AS time_spent_opening
      FROM activities
      GROUP BY user_id
), calculation AS(
SELECT user_id, 
      (time_spent_sending/(time_spent_sending+time_spent_opening))*100.0 AS send_perc,
      (time_spent_opening/(time_spent_sending+time_spent_opening))*100.0 AS open_perc
FROM times)
SELECT ab.age_bucket, ROUND(AVG(c.send_perc),2), ROUND(AVG(c.open_perc),2)
FROM calculation c INNER JOIN 
age_breakdown AS ab ON c.user_id = ab.user_id
GROUP BY ab.age_bucket ORDER BY ab.age_bucket