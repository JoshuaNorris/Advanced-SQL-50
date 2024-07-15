with cte as (
    select customer_id, product_id, count(*)  as count
    from Orders
    group by customer_id, product_id
),

cte2 as (
    select cte.customer_id, max(count) as count
    from cte join Products p on p.product_id = cte.product_id
    group by cte.customer_id
)

select cte.customer_id, cte.product_id, p.product_name
from cte join cte2 on cte.count = cte2.count and cte.customer_id = cte2.customer_id
join Products p on p.product_id = cte.product_id