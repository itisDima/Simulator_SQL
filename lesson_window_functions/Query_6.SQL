-- Дополните запрос из предыдущего задания и с помощью оконной функции для каждого заказа 
-- каждого пользователя рассчитайте, сколько времени прошло с момента предыдущего заказа. 
-- Для этого сначала в отдельном столбце с помощью LAG сделайте смещение по столбцу time на одно
-- значение назад. Столбец со смещёнными значениями назовите time_lag. 
-- Затем отнимите от каждого значения в колонке time новое значение 
-- со смещением (либо можете использовать уже знакомую функцию AGE). 
-- Колонку с полученным интервалом назовите time_diff.
-- По-прежнему не учитывайте отменённые заказы. Также оставьте в запросе порядковый номер каждого заказа, 
-- рассчитанный на прошлом шаге. Результат отсортируйте сначала по возрастанию id пользователя, 
-- затем по возрастанию порядкового номера заказа.
-- Добавьте в запрос оператор LIMIT и выведите только первые 1000 строк результирующей таблицы.
-- Поля в результирующей таблице: user_id, order_id, time, order_number, time_lag, time_diff
SELECT user_id,
       order_id,
       time,
       row_number() OVER(PARTITION BY user_id
                         ORDER BY time) as order_number,
       lag(time, 1) OVER(PARTITION BY user_id
                         ORDER BY time) as time_lag,
       time - lag(time, 1) OVER(PARTITION BY user_id
                                ORDER BY time) as time_diff
FROM   user_actions
WHERE  order_id not in (SELECT order_id
                        FROM   user_actions
                        WHERE  action = 'cancel_order')
ORDER BY user_id, order_number limit 1000