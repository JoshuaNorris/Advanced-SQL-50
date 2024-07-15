with ranked_employees as (
    select name, salary, departmentId, dense_rank () over(partition by departmentId order by salary desc) as rank
    from Employee
)

select d.name as Department, e.name as Employee, e.salary
from ranked_employees e
join Department d on e.departmentId = d.id
where e.rank = 1