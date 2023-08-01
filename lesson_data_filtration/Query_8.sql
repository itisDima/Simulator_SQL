SELECT product_id,
       '25%' as discount,
       price,
       price*0.75 as price_discounted,
       name
FROM   products
WHERE  name <> 'чайный гриб'
   and (name like '%чай%'
   and price > 60)
