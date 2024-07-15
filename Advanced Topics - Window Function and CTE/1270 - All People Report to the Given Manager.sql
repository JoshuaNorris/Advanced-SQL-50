select e.employee_id
from Employees e
join Employees m1 on e.manager_id = m1.employee_id
join Employees m2 on m1.manager_id = m2.employee_id
where
    e.employee_id <> 1
    and (
        e.manager_id = 1
        or m1.manager_id = 1
        or m2.manager_id = 1
    )