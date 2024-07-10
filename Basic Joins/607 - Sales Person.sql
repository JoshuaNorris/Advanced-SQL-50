select distinct p.name
from SalesPerson p
left join Orders o on o.sales_id  = p.sales_id
where p.sales_id not in (
    select distinct o.sales_id
    from Orders o
    join Company c on o.com_id = c.com_id
    where c.name = 'RED'
)