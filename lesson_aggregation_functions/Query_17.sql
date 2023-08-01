SELECT
    COUNT(DISTINCT order_id) AS orders,
    COUNT(DISTINCT order_id) FILTER (WHERE array_length(product_ids, 1) >= 5) AS large_orders,
    ROUND(COUNT(DISTINCT order_id) FILTER (WHERE array_length(product_ids, 1) >= 5) /
    CAST(COUNT(DISTINCT order_id) AS DECIMAL), 2) AS large_orders_share
FROM orders
