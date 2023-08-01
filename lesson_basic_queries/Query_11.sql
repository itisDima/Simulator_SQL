SELECT courier_id,
       coalesce(date_part('year', birth_date)::varchar, 'unknown') as birth_year
FROM   couriers
ORDER BY birth_year desc, courier_id