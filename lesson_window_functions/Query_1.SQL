--Примените оконные функции к таблице products и с помощью ранжирующих функций упорядочьте 
--все товары по цене — от самых дорогих к самым дешёвым. Добавьте в таблицу следующие колонки:
--1. Колонку product_number с порядковым номером товара
--2. Колонку product_rank с рангом товара с пропусками рангов
--3. Колонку product_dense_rank с рангом товара без пропусков рангов
--Поля в результирующей таблице: product_id, name, price, product_number, 
--product_rank, product_dense_rank
SELECT product_id,
       name,
       price,
       row_number() OVER(ORDER BY price desc) as product_number,
       rank() OVER(ORDER BY price desc) as product_rank,
       dense_rank() OVER(ORDER BY price desc) as product_dense_rank
FROM products