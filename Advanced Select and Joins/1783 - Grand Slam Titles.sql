with Wimbledon as (
    select Wimbledon as player_id, count(*) as count
    from Championships
    group by Wimbledon
),
Fr_open  as (
    select Fr_open  as player_id, count(*) as count
    from Championships
    group by Fr_open 
),
US_open   as (
    select US_open   as player_id, count(*) as count
    from Championships
    group by US_open  
),
Au_open   as (
    select Au_open   as player_id, count(*) as count
    from Championships
    group by Au_open  
),

together as (
    select * from Wimbledon
    union all
    select * from Fr_open
    union all
    select * from US_open
    union all
    select * from Au_open
)

select p.player_id, p.player_name, sum(count) as grand_slams_count
from together t join Players p on t.player_id = p.player_id
group by p.player_id, p.player_name