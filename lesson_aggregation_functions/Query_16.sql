SELECT
    COUNT(DISTINCT user_id) - 
    COUNT(DISTINCT user_id) FILTER (WHERE user_id  IN (SELECT 
                                                            user_id
                                                      FROM user_actions
                                                      WHERE action = 'cancel_order')) AS users_count
FROM user_actions