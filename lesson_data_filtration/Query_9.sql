SELECT user_id,
       action,
       order_id,
       time
FROM   user_actions
WHERE  user_id in (170, 200, 230)
   and (time between '2022-08-24'
   and '2022-09-05')
ORDER BY time desc