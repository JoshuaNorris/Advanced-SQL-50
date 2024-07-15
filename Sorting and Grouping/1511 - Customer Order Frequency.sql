with June as (
    select o.customer_id, sum(o.quantity * p.price) as spent
    from Orders o join Product p on o.product_id = p.product_id
    where Year(o.order_date) = '2020' and Month(o.order_date) = '06'
    group by o.customer_id
    having sum(o.quantity * p.price) >= 100
),

July as (
    select o.customer_id, sum(o.quantity * p.price) as spent
    from Orders o join Product p on o.product_id = p.product_id
    where Year(o.order_date) = '2020' and Month(o.order_date) = '07'
    group by o.customer_id
    having sum(o.quantity * p.price) >= 100
)

select c.customer_id, c.name
from June join July on June.customer_id = July.customer_id
join Customers c on June.customer_id = c.customer_id
