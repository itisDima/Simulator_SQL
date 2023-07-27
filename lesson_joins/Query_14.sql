WITH users_orders AS   
    (SELECT
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
        ORDER BY user_id, order_id )


SELECT
    user_id,
    COUNT(order_id) AS orders_count,
    ROUND(AVG(array_length(product_ids, 1)), 2) AS avg_order_size,
    SUM(order_price) AS sum_order_value,
    ROUND(AVG(order_price), 2) AS avg_order_value,
    MIN(order_price) AS min_order_value,
    MAX(order_price) AS max_order_value
FROM
    (
        SELECT 
            user_id,
            users_orders.order_id AS order_id,
            product_ids,
            order_price
        FROM users_orders
            LEFT JOIN 
                (
                    WITH subq_1 AS
            (
                SELECT
                    order_id,
                    sub_1.product_id AS product_id,
                    price
                FROM 
                    (
                    SELECT
                        order_id,
                        unnest(product_ids) AS product_id
                    FROM orders
                    ) AS sub_1
                    LEFT JOIN products
                        ON sub_1.product_id = products.product_id
                ORDER BY order_id, product_id
                )
            SELECT
                order_id,
                SUM(price) AS order_price
            FROM subq_1
            GROUP BY order_id
            ORDER BY order_id
                ) AS r
                ON users_orders.order_id = r.order_id
    ) AS joins_tables
GROUP BY user_id
ORDER BY user_id
LIMIT 1000