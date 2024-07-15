with loud_scores as (
    select exam_id, min(score) as min_score, max(score) as max_score
    from Exam
    group by exam_id
),

loud_students as (
    select distinct e.student_id
    from Exam e
    join loud_scores ls on e.exam_id = ls.exam_id and (
       e.score = ls.min_score or e.score = ls.max_score
    )
)

select s.student_id, s.student_name
from Student s
where s.student_id not in (select * from loud_students)
and s.student_id in (select student_id from Exam)