--Примените оконную функцию к таблице products и с помощью агрегирующей функции в отдельной колонке 
--для каждой записи проставьте цену самого дорогого товара.Колонку с этим значением назовите max_price.
--Затем для каждого товара посчитайте долю его цены в стоимости самого 
--дорогого товара — просто поделите одну колонку на другую. 
--Полученные доли округлите до двух знаков после запятой. Колонку с долями назовите share_of_max.
--Поля в результирующей таблице: product_id, name, price, max_price, share_of_max.
SELECT product_id,
       name,
       price,
       max(price) OVER() as max_price,
       round(price / max(price) OVER(), 2) as share_of_max
FROM   products
ORDER BY price desc, product_id