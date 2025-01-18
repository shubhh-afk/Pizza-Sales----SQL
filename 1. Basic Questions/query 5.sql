-- List the top 5 most ordered pizza types along with their quantities.  

SELECT 
    pt.name AS top_5_most_ordered_pizza,
    SUM(od.quantity) AS quantity_ordered
FROM
    pizza_types AS pt
        JOIN
    pizzas AS p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
GROUP BY pt.name
ORDER BY quantity_ordered DESC
LIMIT 5;
