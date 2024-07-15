with id as (select x, row_number() over(order by x) as id
from Point)

select min(id2.x -id1.x) as shortest
from id id1 join id id2 on id1.id = id2.id - 1