SELECT
    round( avg(
        case 
            when customer_pref_delivery_date = order_date then 1.0
            else 0
        end
    ) * 100, 2) as immediate_percentage
from Delivery