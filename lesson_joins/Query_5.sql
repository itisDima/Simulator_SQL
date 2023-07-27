SELECT l.user_id as user_id_left,
       r.user_id as user_id_right,
       order_id,
       time,
       action,
       sex,
       birth_date
FROM   user_actions as l
    LEFT JOIN users as r
        ON l.user_id = r.user_id
WHERE r.user_id IS NOT NULL
ORDER BY user_id_left 