SELECT
    sex,
    CAST(MAX(DATE_PART('month', birth_date)) AS INTEGER) AS max_month
FROM users
GROUP BY sex
ORDER BY sex