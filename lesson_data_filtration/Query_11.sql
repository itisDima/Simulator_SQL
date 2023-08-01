SELECT user_id,
       birth_date
FROM   users
WHERE  birth_date is not null
   and sex = 'male'
ORDER BY birth_date desc limit 50