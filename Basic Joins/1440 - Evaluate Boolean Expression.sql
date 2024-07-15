select e.left_operand, e.operator, e.right_operand,
    CASE
        when e.operator = '>' and vl.value > vr.value then 'true'
        when e.operator = '>' and vl.value <= vr.value then 'false'
        when e.operator = '<' and vl.value < vr.value then 'true'
        when e.operator = '<' and vl.value >= vr.value then 'false'
        when e.operator = '=' and vl.value = vr.value then 'true'
        when e.operator = '=' and vl.value <> vr.value then 'false'
    end as value
from Expressions e
left join Variables vl on e.left_operand = vl.name 
left join Variables vr on e.right_operand = vr.name