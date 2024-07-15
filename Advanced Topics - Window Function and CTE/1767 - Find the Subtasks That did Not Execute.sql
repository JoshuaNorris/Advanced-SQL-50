with cte as (
    select task_id, subtasks_count as subtask_id
    from tasks
    
    union all

    select c.task_id, c.subtask_id -1
    from cte c
    where c.subtask_id > 1
)

select t.task_id, t.subtask_id
from cte t
left join Executed e on e.task_id = t.task_id and e.subtask_id = t.subtask_id
where e.task_id is null
