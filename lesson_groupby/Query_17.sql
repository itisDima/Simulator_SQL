SELECT
    user_id,
    COUNT(order_id) FILTER (WHERE action = 'create_order') AS orders_count,
    ROUND((CAST(COUNT(order_id) FILTER (WHERE action = 'cancel_order') AS DECIMAL)) /
    (COUNT(order_id) FILTER (WHERE action = 'create_order')), 2) AS cancel_rate
FROM user_actions
GROUP BY user_id
HAVING (COUNT(order_id) FILTER (WHERE action = 'create_order') > 3) AND 
       (ROUND((CAST(COUNT(order_id) FILTER (WHERE action = 'cancel_order') AS DECIMAL)) /
       (COUNT(order_id) FILTER (WHERE action = 'create_order')), 2) >= 0.5)
ORDER BY user_id