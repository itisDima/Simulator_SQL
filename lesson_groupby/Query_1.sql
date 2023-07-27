SELECT 
    sex,
    COUNT(courier_id) AS couriers_count
FROM couriers
GROUP BY sex
ORDER BY couriers_count ASC