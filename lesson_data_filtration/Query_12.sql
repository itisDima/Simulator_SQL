SELECT order_id,
       time
FROM   courier_actions
WHERE  courier_id = 100
   and action = 'deliver_order'
ORDER BY time desc limit 10