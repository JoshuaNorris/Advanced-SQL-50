with ranked_employees as (
    select p.project_id, e.employee_id, rank() over(
        partition by p.project_id order by e.experience_years desc
    ) as rank
    from Employee e join Project p on p.employee_id = e.employee_id
)

select project_id, employee_id
from ranked_employees
where rank = 1