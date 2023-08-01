SELECT sum(case when name = 'сухарики' then price*3
                when name = 'чипсы' then price*2
                when name = 'энергетический напиток' then price end) as order_price
FROM   products