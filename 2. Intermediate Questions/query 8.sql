-- Find the category-wise distribution of pizzas.

SELECT 
    category, COUNT(name)
FROM
    pizza_types
GROUP BY category;