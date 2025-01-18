-- Analyze the cumulative revenue generated over time.

select order_date, revenue,
round(sum(revenue) over(order by order_date)) as cumulative_revenue
from
(select orders.order_date,
round(sum(order_details.quantity * pizzas.price)) as revenue
from order_details 
join pizzas
on order_details.pizza_id = pizzas.pizza_id
join orders 
on orders.order_id = order_details.order_id
group by orders.order_date) as sales;