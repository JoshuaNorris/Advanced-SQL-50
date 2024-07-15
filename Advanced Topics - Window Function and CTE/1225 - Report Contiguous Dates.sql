with cte as (
    select fail_date as date, 'failed' as period_state, dateadd(day, dense_rank() over(order by fail_date asc) * -1, fail_date)as block_id
    from Failed

    union

    select success_date as date, 'succeeded' as period_state, dateadd(day, dense_rank() over(order by success_date asc) * -1, success_date)as block_id
    from Succeeded
)

select period_state, min(date) as start_date, max(date) as end_date
from cte
where year(date) = '2019'
group by block_id, period_state
order by min(date)