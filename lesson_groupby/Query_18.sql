SELECT
    CAST(DATE_PART('isodow', time) AS INTEGER) AS weekday_number,
    TO_CHAR (time, 'Dy') AS weekday,
    COUNT(order_id) FILTER (WHERE action = 'create_order') AS created_orders,
    COUNT(order_id) FILTER (WHERE action = 'cancel_order') AS canceled_orders,
    COUNT(order_id) FILTER (WHERE action = 'create_order') -
    COUNT(order_id) FILTER (WHERE action = 'cancel_order') AS actual_orders,
    ROUND((CAST(COUNT(order_id) FILTER (WHERE action = 'create_order') -
    COUNT(order_id) FILTER (WHERE action = 'cancel_order') AS DECIMAL)) /
    (COUNT(order_id) FILTER (WHERE action = 'create_order')), 3) AS success_rate
FROM user_actions
WHERE time BETWEEN '2022-08-24' AND '2022-09-07'
GROUP BY weekday_number, weekday
ORDER BY weekday_number 