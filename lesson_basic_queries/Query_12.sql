SELECT name,
       price,
       price*1.05 as new_price
FROM   products
ORDER BY new_price desc