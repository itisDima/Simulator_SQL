SELECT sum(price) as order_price
FROM   products
WHERE  name = 'сухарики'
    or name = 'энергетический напиток'
    or name = 'чипсы'