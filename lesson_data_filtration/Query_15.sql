SELECT action,
       order_id,
       time,
       user_id
FROM   user_actions
WHERE  date_part('dow', time) = 3
   and date_part('hour', time) >= 12
   and date_part('hour', time) < 16
   and action = 'cancel_order'
   and date_part('month', time) = 8
ORDER BY time desc