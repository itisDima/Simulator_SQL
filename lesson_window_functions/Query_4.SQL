-- Сначала на основе таблицы orders сформируйте новую таблицу с общим числом заказов по дням. 
-- При подсчёте числа заказов не учитывайте отменённые заказы (их можно определить по таблице user_actions). 
-- Колонку с днями назовите date, а колонку с числом заказов — orders_count.
-- Затем поместите полученную таблицу в подзапрос и примените к ней оконную функцию
-- в паре с агрегирующей функцией SUM для расчёта накопительной суммы числа заказов. 
-- Не забудьте для окна задать инструкцию ORDER BY по дате. Колонку с накопительной суммой назовите orders_cum_count.
-- Поля в результирующей таблице: date, orders_count, orders_cum_count
SELECT date,
       orders_count,
       sum(orders_count) OVER(ORDER BY date) :: integer as orders_cum_count --перевод формата DECIMAL в INTEGER
FROM   (SELECT creation_time::date as date,
               count(order_id) as orders_count
        FROM   orders
        WHERE  order_id not in (SELECT order_id
                                FROM   user_actions
                                WHERE  action = 'cancel_order')
        GROUP BY creation_time::date) as subq_1