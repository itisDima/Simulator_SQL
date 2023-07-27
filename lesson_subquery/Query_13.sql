SELECT
    product_id,
    COUNT(product_id) AS times_purchased
FROM
    (
    SELECT
        creation_time,
        order_id,
        product_ids,
        unnest(product_ids) AS product_id
    FROM orders
    ) AS subq_1
GROUP BY product_id
ORDER BY times_purchased DESC
LIMIT 10