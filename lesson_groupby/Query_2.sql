SELECT 
    action,
    COUNT(order_id) AS orders_count
FROM user_actions
GROUP BY action
ORDER BY orders_count
