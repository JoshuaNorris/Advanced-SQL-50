with apples as (
    select * from Sales where fruit = 'apples'
),
oranges as (
    select * from Sales where fruit = 'oranges'
)

select a.sale_date,
    coalesce(a.sold_num, 0) - coalesce(o.sold_num, 0) as diff
from apples a
full join oranges o on a.sale_date = o.sale_date
