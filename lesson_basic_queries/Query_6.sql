SELECT name,
       length(name) as name_length,
       price
FROM   products
ORDER BY name_length desc limit 1