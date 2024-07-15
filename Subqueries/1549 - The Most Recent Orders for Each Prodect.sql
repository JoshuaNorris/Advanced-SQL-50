with ranked_orders as (
    select order_id, order_date, product_id, rank() over(partition by product_id order by order_date desc) as rank
    from Orders
)

select p.product_name, o.product_id, o.order_id, o.order_date
from ranked_orders o
join Products p on o.product_id = p.product_id
where rank = 1
order by p.product_name asc, o.product_id asc, o.order_id asc