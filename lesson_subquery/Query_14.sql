WITH subq_2  AS (SELECT
    order_id,
    COUNT(product_id) AS product_id,
    product_ids
FROM
    (
    SELECT
        creation_time,
        order_id,
        product_ids,
        unnest(product_ids) AS product_id
    FROM orders
    ) AS subq_1
WHERE product_id IN (
                        SELECT
                            product_id
                        FROM products
                        ORDER BY price DESC
                        LIMIT 5
                            )
GROUP BY order_id, product_ids)

SELECT 
    order_id,
    product_ids
FROM subq_2
WHERE product_id >= 1
ORDER BY order_id
