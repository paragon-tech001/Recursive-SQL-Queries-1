-- Find the hierarchy of managers for a given employee "David".

with recursive emp_hierarchy as (
select id, name, manager_id,designation, 1 as level
	from emp_details
	where name = 'David'
union 
select E.id, E.name, E.manager_id, E.designation, 1 + H.level as level
	from emp_hierarchy H
	join emp_details E
	on H.manager_id = E.id
)
select E2.name as manager_name, E2.id as manager_id, H2.name as emp_name, H2.id as emp_id,level
from emp_hierarchy H2
join emp_details E2
on E2.id = H2.manager_id