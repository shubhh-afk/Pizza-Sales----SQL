-- Identify the most common pizza size ordered.

SELECT 
    p.size, COUNT(o.quantity) AS most_ordered
FROM
    pizzas p
        JOIN
    order_details o ON p.pizza_id = o.pizza_id
GROUP BY p.size
ORDER BY most_ordered DESC
LIMIT 1;