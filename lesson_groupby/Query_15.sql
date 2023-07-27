SELECT
    ROUND(AVG(array_length(product_ids, 1)), 2) AS avg_order_size,
    CASE
    WHEN DATE_PART('isodow', creation_time) = 6 OR 
         DATE_PART('isodow', creation_time) = 7 THEN 'weekend'
    ELSE 'weekdays'
    END AS week_part
FROM orders
GROUP BY week_part
ORDER BY avg_order_size