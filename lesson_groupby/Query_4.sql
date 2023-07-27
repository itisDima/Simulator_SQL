SELECT
    DATE_TRUNC('month', time) AS month,
    action,
    COUNT(order_id) AS orders_count
FROM user_actions
GROUP BY month, action
ORDER BY month, action