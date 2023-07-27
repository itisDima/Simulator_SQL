SELECT
    user_id,
    COUNT(order_id) AS orders_count,
    ROUND((SELECT AVG(count_orders) FROM (SELECT user_id, COUNT(order_id) AS count_orders 
                                    FROM user_actions
                                    WHERE action = 'create_order'
                                    GROUP BY user_id) AS sub_1), 2) AS orders_avg,
    COUNT(order_id) - ROUND((SELECT AVG(count_orders) FROM (SELECT user_id, COUNT(order_id) AS count_orders 
                                    FROM user_actions
                                    WHERE action = 'create_order'
                                    GROUP BY user_id) AS sub_1), 2) AS orders_diff
FROM user_actions
WHERE action = 'create_order'
GROUP BY user_id
ORDER BY user_id
LIMIT 1000
