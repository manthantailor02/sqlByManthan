use windowsdb;
select *,
dense_rank() over(partition by dept order by salary ) from employees;

select *,
dense_rank() over(partition by dept order by hire_year ) from employees;

-- har dept ke maximum salaried person ki datials
-- 1st method with using max
select * from
(select *, max(salary) over(partition by dept) as deptSalary from employees) as TRH;

select * from
(select *, max(salary) over(partition by dept) as deptSalary from employees) as TRH
where salary=deptSalary;

-- 2nd method using rank

select * from 
(select *, rank() over(partition by dept order by salary desc) as rnk from employees) as temp
where rnk=1;

-- finde the second highest salary person 
-- 1st method
select * from
(select *, dense_rank() over(order by salary) as drank from employees) as xyz
where drank=2;

-- 2nd method
select * from employees where salary=
(select max(salary) from employees where salary<(select max(salary) from employees) );

-- 4th lowest salary
select * from 
(select *, dense_rank() over(order by salary) as drank from employees) as 4th_lowest_salary
where drank=4 ;