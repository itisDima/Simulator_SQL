SELECT
    courier_id
FROM courier_actions
WHERE DATE_PART('month', time) = 9 AND
      DATE_PART('year', time) = 2022 AND
      action = 'deliver_order'
GROUP BY courier_id
HAVING COUNT(order_id) = 1
ORDER BY courier_id