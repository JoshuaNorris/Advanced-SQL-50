with orders_counted as (
    select customer_number, count(*) as count
    from Orders
    group by customer_number
)

select top 1 customer_number
from orders_counted
order by count desc