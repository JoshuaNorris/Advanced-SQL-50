with liked as (
    select page_id
    from Likes
    where user_id = 1
)

select distinct page_id as recommended_page
from Friendship f
join Likes l1 on 
    (l1.user_id = f.user1_id
    or l1.user_id = f.user2_id)
    and l1.user_id <> 1
    and l1.page_id not in (select * from liked)
where f.user1_id = 1 or f.user2_id = 1
order by page_id asc
