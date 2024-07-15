with ranked_logins as (
    select player_id, device_id, dense_rank() over(partition by player_id order by event_date asc) as rank
    from Activity
)

select player_id, device_id
from ranked_logins
where rank = 1