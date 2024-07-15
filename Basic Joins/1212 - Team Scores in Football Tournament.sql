with host_team as (
    select host_team as team_id,
        case
            when host_goals > guest_goals then 3
            else 1
        end as points
    from matches
    where host_goals >= guest_goals
),
guest_team as (
    select guest_team as team_id,
        case
            when guest_goals > host_goals then 3
            else 1
        end as points
    from matches
    where guest_goals >= host_goals
)

select t.team_id, t.team_name, coalesce(sum(points), 0) as num_points
from (
    select * from host_team union all select * from guest_team
) as gh
right join Teams as t on t.team_id = gh.team_id
group by t.team_id, t.team_name
order by num_points desc, team_id asc