SELECT
    array_length(product_ids, 1) AS order_size,
    COUNT(order_id) AS orders_count
FROM orders
WHERE creation_time BETWEEN '2022-08-29' AND '2022-09-05'
GROUP BY order_size
ORDER BY order_size