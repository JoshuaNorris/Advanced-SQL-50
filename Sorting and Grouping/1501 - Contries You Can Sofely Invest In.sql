with global_average as (
    select avg(cast(duration as decimal)) gl_avg from Calls
),

caller as (
    select caller_id as id, c.name as country, ca.duration as duration
    from Calls ca join Person p on p.id = ca.caller_id
    join Country c on c.country_code = substring(p.phone_number, 1, 3)
),

callee as (
    select callee_id as id, c.name as country, ca.duration as duration
    from Calls ca join Person p on p.id = ca.callee_id
    join Country c on c.country_code = substring(p.phone_number, 1, 3)
)

select country, sum(duration), ga.gl_avg from (
    select * from caller
    union
    select * from callee
) as all_calls cross join global_average ga
group by country, ga.gl_avg
having avg(cast(duration as decimal)) > ga.gl_avg