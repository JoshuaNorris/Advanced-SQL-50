
select seat_id
from Cinema c1 join Cinema c2 on c1.free = 1 and c2.free = 1 and (c1.seat_id = c2_seat_id - 1 or c1.seat_id = c2_seat_id + 1)