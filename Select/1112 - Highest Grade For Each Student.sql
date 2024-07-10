with highest_grade as (
    select student_id, max(grade) as grade
    from Enrollments
    group by student_id
)

select e.student_id, min(e.course_id) as course_id, e.grade
from Enrollments e
join highest_grade hg on e.student_id = hg.student_id and e.grade = hg.grade
group by e.student_id, e.grade
order by student_id asc