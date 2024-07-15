select u.name, sum(amount) as balance
from Users u
join Transactions t on t.account = u.account
group by u.name
having sum(amount) > 10000