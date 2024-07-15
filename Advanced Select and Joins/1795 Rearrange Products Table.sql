with store1 as (select product_id, 'store1' as store, store1 as price from Products),
store2 as (select product_id, 'store2' as store, store2 as price from Products),
store3 as (select product_id, 'store3' as store, store3 as price from Products)

select * from store1 where price is not null
union all
select * from store2 where price is not null
union all
select * from store3 where price is not null