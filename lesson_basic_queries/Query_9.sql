SELECT concat('Заказ №' ,
              ' ',
              order_id,
              ' ',
              'создан',
              ' ',
              creation_time::date) as order_info
FROM   orders limit 200