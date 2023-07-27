SELECT
    user_id,
    COUNT(order_id) AS created_orders
FROM user_actions
WHERE action = 'create_order' AND
      DATE_PART('month', time) = 8 AND
      DATE_PART('year', time) = 2022
GROUP BY user_id 
ORDER BY created_orders DESC, user_id
LIMIT 5