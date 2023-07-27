SELECT
    CASE
    WHEN  cast(date_part('year', age(current_date, birth_date)) as integer) >= 19 AND
          cast(date_part('year', age(current_date, birth_date)) as integer) <= 24 THEN '19-24'
    WHEN  cast(date_part('year', age(current_date, birth_date)) as integer) >= 25 AND
          cast(date_part('year', age(current_date, birth_date)) as integer) <= 29 THEN '25-29'
    WHEN  cast(date_part('year', age(current_date, birth_date)) as integer) >= 30 AND
          cast(date_part('year', age(current_date, birth_date)) as integer) <= 35 THEN '30-35'
    WHEN  cast(date_part('year', age(current_date, birth_date)) as integer) >= 36 AND
          cast(date_part('year', age(current_date, birth_date)) as integer) <= 41 THEN '36-41'
    END AS group_age,
    COUNT(user_id) AS users_count
FROM users
WHERE birth_date IS NOT NULL
GROUP BY group_age
ORDER BY group_age