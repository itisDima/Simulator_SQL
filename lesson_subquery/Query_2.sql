WITH subq_1 AS
    (SELECT
        user_id,
        COUNT(order_id) AS count_orders
    FROM user_actions
    WHERE action != 'cancel_order'
    GROUP BY user_id)

SELECT
    ROUND(AVG(count_orders), 2) AS orders_avg
FROM subq_1
