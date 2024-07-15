


select distinct email as Email
from (
    select email, rank() over(
        partition by email order by id asc
    ) as rank
    from Person
) as ranked
where rank <> 1