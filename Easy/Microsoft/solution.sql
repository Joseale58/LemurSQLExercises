SELECT sender_id,
      count(*) as message_count
      FROM messages
      WHERE EXTRACT(MONTH FROM sent_date) = 08 
      AND EXTRACT(YEAR FROM sent_date) = 2022 
      GROUP BY sender_id
      ORDER BY message_count desc
LIMIT 2;