select distinct t1.id, 
    case
        when t1.p_id is null then 'Root'
        when t2.p_id is null then 'Leaf'
        else 'Inner'
    end as type
from Tree t1 full outer join Tree t2 on t1.id = t2.p_id
where t1.id is not null