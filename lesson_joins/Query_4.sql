SELECT
    COUNT(DISTINCT user_actions.user_id) AS users_count
FROM user_actions
LEFT JOIN users
ON user_actions.user_id = users.user_id