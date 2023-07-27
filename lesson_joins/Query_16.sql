WITH subq_1 AS   
    (
    SELECT
        creation_time,
        subq_1.order_id AS order_id,
        time,
        time - creation_time AS DIFF_TIME
    FROM
        (
        SELECT
            order_id,
            courier_id,
            time,
            action
        FROM courier_actions
        WHERE action = 'deliver_order'
        ) AS subq_1
        LEFT JOIN orders
            ON subq_1.order_id = orders.order_id
    ORDER BY DIFF_TIME DESC
    LIMIT 10 
    )
SELECT
    order_id
FROM subq_1