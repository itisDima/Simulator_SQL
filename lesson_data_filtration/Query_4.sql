SELECT
    product_id,
    name,
    price AS old_price,
    price*0.8 AS new_price
FROM products
WHERE price*0.8 > 100
ORDER BY product_id