select actor_id, director_id
from (
    select actor_id, director_id, count(*) as count
    from ActorDirector
    group by actor_id, director_id
) as counted
where count = 3