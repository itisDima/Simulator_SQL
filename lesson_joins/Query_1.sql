SELECT
    user_actions.user_id AS user_id_left,
    users.user_id AS user_id_right,
    order_id,
    time,
    action,
    sex,
    birth_date
FROM user_actions
JOIN users
ON user_actions.user_id = users.user_id 
ORDER BY user_id_left
