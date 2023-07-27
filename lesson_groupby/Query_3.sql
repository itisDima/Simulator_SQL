SELECT 
    DATE_TRUNC('month', creation_time) AS month,
    COUNT(order_id) AS orders_count
FROM orders
GROUP BY month
ORDER BY month 