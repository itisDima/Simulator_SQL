SELECT
    product_id,
    name,
    price,
    CASE
    WHEN price >= ROUND((SELECT AVG(price) FROM products), 2) + 50 THEN price*0.85
    WHEN price <= ROUND((SELECT AVG(price) FROM products), 2) - 50 THEN price*0.90
    ELSE price
    END AS new_price
FROM products
ORDER BY price DESC, product_id