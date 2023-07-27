SELECT user_id
FROM (SELECT
        user_id,
        MAX(time)
      FROM user_actions
      WHERE time < '2022-09-08' AND action = 'create_order'
      GROUP BY user_id) AS s
ORDER BY user_id
