SELECT product_id,
       name,
       price,
       round(price/1.2*0.2, 2) as tax,
       round(price/1.2, 2) as price_before_tax
FROM   products
ORDER BY price_before_tax desc, product_id asc