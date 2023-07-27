WITH sb_1 AS
    (
    SELECT
        subq_1.product_id AS product_id,
        product_ids,
        subq_1.order_id AS order_id,
        name
    FROM 
        (
        SELECT
            product_ids,
            order_id,
            unnest(product_ids) AS product_id
        FROM orders
        ) AS subq_1
        LEFT JOIN products 
            ON subq_1.product_id = products.product_id
    )

SELECT
    order_id,
    array_agg(name) AS product_names
FROM sb_1
GROUP BY order_id
LIMIT 1000