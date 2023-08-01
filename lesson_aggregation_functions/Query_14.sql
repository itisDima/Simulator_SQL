SELECT round(avg(array_length(product_ids, 1)), 2) as avg_order_size
FROM   orders
WHERE  (date_part('dow', creation_time) = 0)
    or (date_part('dow', creation_time) = 6)
