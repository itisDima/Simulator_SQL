SELECT courier_id
FROM   couriers
WHERE  date_part('year', birth_date) >= 1990
   and date_part('year', birth_date) <= 1995
ORDER BY courier_id