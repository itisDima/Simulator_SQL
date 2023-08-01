SELECT order_id
FROM   user_actions
WHERE  action = 'create_order'
   and date_part('month', time) < 9
ORDER BY order_id asc
