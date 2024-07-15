select date_id, make_name, Count(distinct partner_id) as unique_partners, Count(distinct lead_id) as unique_leads
from DailySales
group by date_id, make_name