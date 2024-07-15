select distinct c.title
from TVProgram p join content c on p.content_id = c.content_id
where c.Kids_content = 'Y'and year(p.program_date) = '2020' and month(p.program_date) = '06' and c.content_type = 'Movies'