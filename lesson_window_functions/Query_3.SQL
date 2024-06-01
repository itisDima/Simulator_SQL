-- Примените две оконные функции к таблице products. Одну с агрегирующей функцией MAX,
-- а другую с агрегирующей функцией MIN — для вычисления максимальной и минимальной цены. 
-- Для двух окон задайте инструкцию ORDER BY по убыванию цены. 
-- Поместите результат вычислений в две колонки max_price и min_price.
-- Поля в результирующей таблице: product_id, name, price, max_price, min_price
SELECT product_id,
       name,
       price,
       max(price) OVER(ORDER BY price desc) as max_price,
       min(price) OVER(ORDER BY price desc) as min_price
FROM   products
ORDER BY price desc, product_id