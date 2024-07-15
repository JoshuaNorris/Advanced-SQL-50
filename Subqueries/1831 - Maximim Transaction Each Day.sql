with ranked_transactions as (
    select transaction_id,
        rank()
        over(
            partition by datefromparts(year(day), month(day), day(day))
            order by amount desc
        ) as rank
    from Transactions
)

select transaction_id
from ranked_transactions
where rank = 1
order by transaction_id asc