SELECT
    COUNT( DISTINCT user_id) AS user_id
FROM (SELECT
        user_id,
        time,
        COUNT(order_id) AS count_orders
      FROM user_actions
      WHERE action = 'create_order'
      GROUP BY user_id, time
      HAVING COUNT(order_id) >= 1
      ) AS sub_1
WHERE time BETWEEN (SELECT MAX(time) FROM user_actions) - INTERVAL '1 week' AND 
                    (SELECT MAX(time) FROM user_actions)