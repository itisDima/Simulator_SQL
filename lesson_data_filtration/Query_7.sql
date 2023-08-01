SELECT name,
       product_id
FROM   products
WHERE  name like 'с%'
   and name not like '% %'