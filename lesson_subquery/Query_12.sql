SELECT
    creation_time,
    order_id,
    product_ids,
    unnest(product_ids) AS product_id
FROM orders
LIMIT 100