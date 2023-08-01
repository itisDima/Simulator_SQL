SELECT case when price > 100 and
                 price != 800 then price*1.05
            else price end as new_price,
       name,
       product_id,
       price
FROM   products
ORDER BY new_price desc, product_id asc