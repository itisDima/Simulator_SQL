SELECT
    sex,
    CAST(MAX(DATE_PART('year', AGE(current_date, birth_date))) AS INTEGER) AS max_age
FROM users
GROUP BY sex
ORDER BY max_age