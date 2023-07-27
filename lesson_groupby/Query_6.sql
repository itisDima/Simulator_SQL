SELECT
    sex,
    CAST(DATE_PART('month', MAX(birth_date)) AS INTEGER) AS max_month
FROM users
GROUP BY sex
ORDER BY sex