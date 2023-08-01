SELECT name,
       upper(split_part(name, ' ', 1)) as first_word,
       price
FROM   products
ORDER BY name