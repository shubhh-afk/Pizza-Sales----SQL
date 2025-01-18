-- Calculate the percentage contribution of each pizza type to total revenue.

WITH TotalSales AS (
    SELECT 
        SUM(order_details.quantity * pizzas.price) AS total_sales
    FROM 
        order_details
    JOIN 
        pizzas ON pizzas.pizza_id = order_details.pizza_id
)
SELECT
    pizza_types.category,
    ROUND(
        (SUM(order_details.quantity * pizzas.price) / (SELECT total_sales FROM TotalSales)) * 100,
        2
    ) AS revenue_percentage
FROM
    pizza_types
JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue_percentage DESC;
    