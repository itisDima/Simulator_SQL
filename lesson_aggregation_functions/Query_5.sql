SELECT count(user_id) as users,
       count(distinct user_id) as unique_users
FROM   user_actions