SELECT
    user_id,
    name
FROM 
    (
    SELECT 
        user_id
    FROM users
    LIMIT 100
    ) AS sub_1
    CROSS JOIN products AS sub_2
ORDER BY user_id, name