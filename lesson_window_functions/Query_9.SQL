-- Отметьте в отдельной таблице тех курьеров, которые доставили в сентябре 2022 года заказов больше, чем в среднем все курьеры.
-- Колонку с результатом сравнения назовите is_above_avg, колонку с числом доставленных заказов 
-- каждым курьером — delivered_orders, а колонку со средним значением — avg_delivered_orders. 
-- При расчёте среднего значения округлите его до двух знаков после запятой. 
-- Результат отсортируйте по возрастанию id курьера.
-- Поля в результирующей таблице: courier_id, delivered_orders, avg_delivered_orders, is_above_avg
SELECT courier_id,
       delivered_orders,
       avg_delivered_orders,
       case when delivered_orders > avg_delivered_orders then 1
            else 0 end as is_above_avg
FROM   (SELECT courier_id,
               count(order_id) as delivered_orders,
               round(avg(count(order_id)) OVER(), 2) as avg_delivered_orders
        FROM   courier_actions
        WHERE  action = 'deliver_order'
           and date_part('month', time) = 9
           and date_part('year', time) = 2022
        GROUP BY courier_id) as subq_1
ORDER BY courier_id