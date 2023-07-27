SELECT
    array_length(product_ids, 1) AS order_size,
    COUNT(order_id) AS orders_count
FROM orders
WHERE DATE_PART('isodow', creation_time) != 7 AND 
      DATE_PART('isodow', creation_time) != 6
GROUP BY order_size
HAVING COUNT(order_id) > 2000
ORDER BY order_size
