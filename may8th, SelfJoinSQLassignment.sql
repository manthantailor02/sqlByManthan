-- whose dept is same as of its dept as its manager

select e.emp_name, e.emp_id, e.department, e.manager_id, m.emp_id, m.emp_name,
m.department
from employees as e
join employees as m
where e.manager_id=m.emp_id and
e.department=m.department;

-- fint employee name and his salary if its is greater than the salary of its manager
select e.emp_name, e.emp_id, e.manager_id, m.emp_id, m.emp_name
from employees as e
join employees as m
where e.manager_id=m.emp_id
and e.salary>m.salary;

-- show all the amp names with managers name
select e.emp_name, m.emp_name as mngr_name
from employees as e
join employees as m
where e.manager_id=m.emp_id;

-- show emp name and their grand manager
select e.emp_name as employee, m.emp_name as manager, gm.emp_name as grand_manager 
from employees as e
join employees as m
on e.manager_id=m.emp_id
join employees as gm
on m.manager_id=gm.emp_id;

-- find emp name who are also the managers
select distinct e.emp_name
from employees as e
join employees as m
where e.emp_id=m.emp_id;