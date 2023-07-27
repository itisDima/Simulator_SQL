SELECT
    user_id,
    CASE
    WHEN birth_date IS NOT NULL THEN
    CAST(DATE_PART('year', AGE((SELECT 
                                    MAX(time)
                                FROM user_actions), birth_date)) AS INTEGER)
    ELSE ROUND((SELECT AVG(ageee) FROM (SELECT
                                            user_id,
                                            CAST(DATE_PART('year', AGE((SELECT 
                                                                            MAX(time)
                                                                        FROM user_actions), birth_date)) AS INTEGER) AS ageee
                                        FROM users) AS sub_2))
    END AS age
FROM users
ORDER BY user_id