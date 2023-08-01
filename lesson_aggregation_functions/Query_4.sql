SELECT count(*) as dates,
       count(birth_date) as dates_not_null
FROM   users