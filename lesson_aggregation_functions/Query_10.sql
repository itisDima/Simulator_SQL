SELECT min(age(current_date, birth_date))::varchar as min_age
FROM   couriers
WHERE  sex = 'male'
