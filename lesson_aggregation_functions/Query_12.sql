SELECT round(avg(price), 2) as avg_price
FROM   products
WHERE  ((name like '%чай%')
    or (name like '%кофе%'))
   and ((name not like '%иван-чай%')
   and (name not like '%чайный гриб%'))
