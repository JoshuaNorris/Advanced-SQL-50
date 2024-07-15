with ranked as (
    select order_id, order_date, customer_id,
        rank() over(partition by customer_id order by order_date desc) as rank
    from Orders
)

select c.name as customer_name, o.customer_id, o.order_id, o.order_date
from ranked o join Customers c on c.customer_id = o.customer_id
where rank <= 3
order by c.name asc, o.customer_id asc, o.order_date desc