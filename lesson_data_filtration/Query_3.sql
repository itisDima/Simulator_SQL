SELECT
    user_id,
    order_id,
    time
FROM user_actions
WHERE action = 'create_order' AND 
    DATE_PART('day', time) >= 6 AND DATE_PART('month', time) >= 9
ORDER BY order_id