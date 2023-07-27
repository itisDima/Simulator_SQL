WITH subq_1 AS 
    (
        SELECT 
        creation_time,
        order_id,
        product_ids,
        unnest(product_ids) as product_id
    FROM orders
    GROUP BY product_id, creation_time, order_id, product_ids
    )

SELECT
    name,
    COUNT(product_id) AS times_purchased
FROM
    (
    SELECT 
            time,
            name,
            creation_time,
            r.order_id,
            product_ids,
            product_id
    FROM 
        (
        SELECT 
            order_id,
            time
        FROM courier_actions 
        WHERE action = 'deliver_order' AND DATE_PART('month', time) = 9 AND DATE_PART('year', time) = 2022) AS r   
        LEFT JOIN (
                      SELECT
                            name,
                            creation_time,
                            order_id,
                            product_ids,
                            products.product_id AS product_id
                       FROM subq_1
                            LEFT JOIN products
                                ON products.product_id = subq_1.product_id
                  ) AS l
            ON r.order_id =l.order_id 
    ) AS subq_32
GROUP BY name
ORDER BY times_purchased DESC
LIMIT 10