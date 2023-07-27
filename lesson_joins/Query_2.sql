SELECT
    COUNT(DISTINCT users.user_id) AS users_count
FROM user_actions 
JOIN users
ON user_actions.user_id = users.user_id 
