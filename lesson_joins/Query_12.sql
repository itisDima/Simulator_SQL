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
LIMIT 1000