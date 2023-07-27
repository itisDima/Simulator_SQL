SELECT
    COUNT(birth_date) AS dates_count
FROM 
    (
    SELECT birth_date
    FROM users
    WHERE birth_date IS NOT NULL
    UNION
    SELECT birth_date
    FROM couriers
    WHERE birth_date IS NOT NULL
    ) AS subq_1
