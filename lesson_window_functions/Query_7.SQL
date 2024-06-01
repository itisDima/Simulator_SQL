-- На основе запроса из предыдущего задания для каждого пользователя рассчитайте, 
-- сколько в среднем времени проходит между его заказами. 
-- Посчитайте этот показатель только для тех пользователей, которые за всё время оформили более одного неотмененного заказа.
-- Среднее время между заказами выразите в часах, округлив значения до целого числа. 
-- Колонку со средним значением времени назовите hours_between_orders. 
-- Результат отсортируйте по возрастанию id пользователя.
-- Добавьте в запрос оператор LIMIT и включите в результат только первые 1000 записей.
-- Поля в результирующей таблице: user_id, hours_between_orders
SELECT user_id,
       avg(time_diff)::integer as hours_between_orders
FROM   (SELECT user_id,
               order_id,
               time,
               extract(epoch
        FROM   (time - lag(time, 1)
        OVER (
        PARTITION BY user_id
        ORDER BY time)))/3600 as time_diff
        FROM   user_actions
        WHERE  order_id not in (SELECT order_id
                                FROM   user_actions
                                WHERE  action = 'cancel_order')) t
WHERE  time_diff is not null
GROUP BY user_id
ORDER BY user_id 
LIMIT 1000
