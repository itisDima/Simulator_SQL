SELECT
    l.user_id AS user_id_left,
    r.user_id AS user_id_right,
    order_id,
    time,
    action,
    sex,
    birth_date
FROM user_actions AS l
LEFT JOIN users AS r
ON l.user_id = r.user_id
ORDER BY user_id_left 
    
