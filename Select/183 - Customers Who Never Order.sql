select c.name
from Customers c
left join Orders o on c.id = o.customerId
where o.id is null