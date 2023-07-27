SELECT
    user_id,
    user_actions.order_id AS order_id,
    product_ids
FROM user_actions
    LEFT JOIN orders
    ON user_actions.order_id = orders.order_id
WHERE user_actions.order_id NOT IN 
                                (
                                SELECT
                                    order_id
                                FROM user_actions
                                WHERE action = 'cancel_order'
                                )
ORDER BY user_id, order_id
LIMIT 1000