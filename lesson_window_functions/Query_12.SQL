-- С помощью оконной функции отберите из таблицы courier_actions всех курьеров, которые работают 
-- в нашей компании 10 и более дней. Также рассчитайте, сколько заказов они уже успели доставить за всё время работы.
-- Будем считать, что наш сервис предлагает самые выгодные условия труда и поэтому за весь 
-- анализируемый период ни один курьер не уволился из компании. Возможные перерывы между сменами 
-- не учитывайте — для нас важна только разница во времени между первым действием курьера и текущей отметкой времени.
-- Текущей отметкой времени, относительно которой необходимо рассчитывать продолжительность работы курьера,
-- считайте время последнего действия в таблице courier_actions. Учитывайте только целые дни, прошедшие
-- с момента первого выхода курьера на работу (часы и минуты не учитывайте).
-- В результат включите три колонки: id курьера, продолжительность работы в днях и число доставленных 
-- заказов. Две новые колонки назовите соответственно days_employed и delivered_orders. 
-- Результат отсортируйте сначала по убыванию количества отработанных дней, затем по возрастанию id курьера.
-- Поля в результирующей таблице: courier_id, days_employed, delivered_orders
with subq_1 as (SELECT courier_id,
                       action,
                       time,
                       rank() OVER(PARTITION BY courier_id
                                   ORDER BY time rows between 1 preceding and 1 preceding) as rankk,
                       count(order_id) filter (WHERE action = 'deliver_order') OVER(PARTITION BY courier_id) as orders_count
                FROM   courier_actions
                ORDER BY time)
SELECT courier_id,
       days_employed,
       orders_count as delivered_orders
FROM   (SELECT courier_id,
               action,
               date_part('days', age((SELECT max(time)
                               FROM   courier_actions), time)) :: integer as days_employed, rankk, orders_count
        FROM   subq_1
        WHERE  rankk = 1) as subq_2
WHERE  days_employed >= 10
ORDER BY days_employed desc, courier_id