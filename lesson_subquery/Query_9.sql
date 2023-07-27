SELECT
    order_id,
    product_ids
FROM orders
WHERE order_id IN (SELECT
                       order_id
                   FROM courier_actions
                   WHERE action = 'deliver_order'
                   ORDER BY time DESC
                   LIMIT 100)
ORDER BY order_id      