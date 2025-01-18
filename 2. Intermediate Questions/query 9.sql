-- Group the orders by date and calculate the average 
-- number of pizzas ordered per day.

SELECT 
    o.order_date, SUM(od.quantity) AS order_count
FROM
    orders o
        JOIN
    order_details od ON o.order_id = od.order_id
GROUP BY o.order_date;



SELECT 
    ROUND(AVG(avg_orders)) AS avg_order_per_day
FROM
    (SELECT 
        o.order_date, SUM(od.quantity) AS avg_orders
    FROM
        orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.order_date) AS order_quantity;
