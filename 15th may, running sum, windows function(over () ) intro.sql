use subquerydb;
select * from employee;

-- over() is windows function
select emp_id,name,avg(salary) over() from employees;

select emp_id,name,avg(salary) over(), salary-avg(salary) over() from employees;

select emp_id,name,avg(salary) over(), count(*) over(),sum(salary)
over() from employee;
select emp_id, name, salary,sum(salary) over(),
concat(round( (salary/sum(salary) over() )*100), '%')  from employee;

-- with order by
select emp_id, name, salary,sum(salary) over(order by salary) from employees; -- running sum

select emp_id, name, salary,sum(salary) over(order by emp_id) from employees;

--  if we use non unique it will not give running sum it is preffered to use unique which have all different values
-- example=>
select emp_id, name, salary,sum(salary) over(order by department) from employees;










