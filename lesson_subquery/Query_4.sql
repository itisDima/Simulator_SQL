SELECT
    product_id,
    name,
    price
FROM products
WHERE price >= (SELECT AVG(price) FROM products) + 20
ORDER BY product_id DESC