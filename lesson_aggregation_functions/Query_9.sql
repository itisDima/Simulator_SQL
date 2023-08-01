SELECT count(array_length(product_ids, 1)) as orders
FROM   orders
WHERE  array_length(product_ids, 1) >= 9