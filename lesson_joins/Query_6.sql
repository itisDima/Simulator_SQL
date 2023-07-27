SELECT
    l.birth_date AS users_birth_date,
    users_count,
    r.birth_date AS couriers_birth_date,
    couriers_count
FROM 
    (
    SELECT birth_date, COUNT(user_id) AS users_count
    FROM users
    WHERE birth_date IS NOT NULL
    GROUP BY birth_date
    ) AS l
        FULL JOIN (
                    SELECT birth_date, COUNT(courier_id) AS couriers_count
                    FROM couriers
                    WHERE birth_date IS NOT NULL
                    GROUP BY birth_date
                   ) AS r
        ON l.birth_date = r.birth_date 
ORDER BY users_birth_date, couriers_birth_date