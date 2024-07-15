with cte as (
    select user_id, visit_date, coalesce(lead(visit_date) over(partition by user_id order by visit_date asc), cast('2021-1-1' as date)) as next_date
    from UserVisits
)

select user_id, max(datediff(day, visit_date, next_date)) as biggest_window
from cte
group by user_id