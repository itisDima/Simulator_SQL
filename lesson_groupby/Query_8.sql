SELECT
    CAST(DATE_PART('year', AGE(current_date, birth_date)) AS INTEGER) AS age,
    COUNT(user_id) AS users_count
FROM users
GROUP BY age
ORDER BY age
