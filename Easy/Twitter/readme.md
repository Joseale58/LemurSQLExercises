## Histogram of Tweets

**Descripción:**  
Escribe una consulta SQL para obtener un histograma de tweets por usuario en 2022.

**Tabla `tweets`:**
| Column Name | Type      |
|-------------|-----------|
| tweet_id    | integer   |
| user_id     | integer   |
| msg         | string    |
| tweet_date  | timestamp |

**Ejemplo de entrada:**
| tweet_id | user_id | msg | tweet_date |
|----------|---------|-----|------------|
| 214252   | 111     | Am considering taking Tesla private... | 2021-12-30 00:00:00 |
| 739252   | 111     | Despite the constant negative press... | 2022-01-01 00:00:00 |

**Salida esperada:**
| tweet_bucket | users_num |
|--------------|-----------|
| 1            | 2         |
| 2            | 1         |

**Explanation:**
Based on the example output, there are two users who posted only one tweet in 2022, and one user who posted two tweets in 2022. The query groups the users by the number of tweets they posted and displays the number of users in each group.

The dataset you are querying against may have different input & output - this is just an example!