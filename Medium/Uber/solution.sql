WITH transactions_ordered_by_time AS (
SELECT *,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date)
        FROM transactions
)
SELECT user_id, spend, transaction_date 
FROM transactions_ordered_by_time 
WHERE row_number = 3;