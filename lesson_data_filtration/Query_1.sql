SELECT name,
       price,
       product_id
FROM   products
WHERE  price <= 100
ORDER BY price desc