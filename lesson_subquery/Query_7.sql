SELECT
    order_id
FROM user_actions
WHERE order_id NOT IN (SELECT
                            order_id
                       FROM user_actions
                       WHERE action = 'cancel_order')
ORDER BY order_id
LIMIT 1000