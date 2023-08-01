SELECT age(max(birth_date), min(birth_date))::varchar as age_diff
FROM   users
WHERE  sex = 'male'