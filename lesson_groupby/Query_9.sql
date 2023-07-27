SELECT
    CAST(DATE_PART('year', AGE(current_date, birth_date)) AS INTEGER) AS age,
    sex,
    COUNT(user_id) AS users_count
FROM users
WHERE birth_date IS NOT NULL
GROUP BY age, sex
ORDER BY age, sex