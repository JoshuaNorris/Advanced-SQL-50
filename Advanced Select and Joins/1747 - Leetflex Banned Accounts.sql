select distinct l1.account_id
from LogInfo l1 join LogInfo l2
    on l1.login >= l2.login and l1.login <= l2.logout
    and l1.ip_address <> l2.ip_address
    and l1.account_id = l2.account_id