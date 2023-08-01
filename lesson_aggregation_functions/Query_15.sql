SELECT count(distinct user_id) as unique_users,
       count(distinct order_id) as unique_orders,
       round(count(distinct order_id)::decimal / count(distinct user_id),
             2) as orders_per_user
FROM   user_actions