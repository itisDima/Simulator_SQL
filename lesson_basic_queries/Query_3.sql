SELECT action,
       courier_id,
       order_id,
       time
FROM   courier_actions
ORDER BY courier_id , action, time desc limit 1000