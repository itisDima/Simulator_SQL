SELECT birth_date,
       courier_id,
       sex
FROM   couriers
WHERE  birth_date is null
ORDER BY courier_id