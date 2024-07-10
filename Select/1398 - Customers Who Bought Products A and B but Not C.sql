select customer_id
from Customers c
join Orders oa on c.customer_id = oa.customer_id and oa.product_name = 'A'
join Orders ob on c.customer_id = ob.customer_id and ob.product_name = 'B'
where customer_id not in (
    select customer_id
    from Orders
    where product_name = 'C'
)