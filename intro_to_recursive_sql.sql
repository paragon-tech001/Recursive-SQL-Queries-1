-- Introduction to Recursive CTE
-- To display serial number 1-10 and their corresponding:
-- even numbers and odd numbers


with recursive CTE (sr_no, odd_no, even_no) as 
(select 1,1,2
union
select sr_no + 1, odd_no + 2, even_no + 2
from CTE
where sr_no <= 19)
select * 
from CTE
