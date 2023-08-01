SELECT
    product_id,
    name
FROM products
WHERE SPLIT_PART(name, ' ', '1') = 'чай' OR LENGTH(name) = 5
ORDER BY product_id