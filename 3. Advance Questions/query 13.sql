-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

WITH revenue_per_pizza AS (
    SELECT 
        pt.category,
        pt.name,
        SUM(od.quantity * p.price) AS revenue
    FROM pizza_types pt
    JOIN pizzas p
        ON pt.pizza_type_id = p.pizza_type_id
    JOIN order_details od
        ON od.pizza_id = p.pizza_id
    GROUP BY pt.category, pt.name
),
ranked_revenue AS (
    SELECT 
        category,
        name,
        revenue,
        RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS rn
    FROM revenue_per_pizza
)
SELECT 
    name, 
    round(revenue,2) 
FROM ranked_revenue
WHERE rn <= 3;



