SELECT customer_id, count(*) as count
FROM rental
GROUP BY customer_id
HAVING count >= 40
ORDER BY count DESC

