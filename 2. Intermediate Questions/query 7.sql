-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(order_time) AS hour, COUNT(order_id) order_count
FROM
    orders
GROUP BY hour;