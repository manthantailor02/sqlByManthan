select *, sum(salary) over(partition by hire_year) from employees;

-- every year
select *, sum(salary) over(partition by hire_year order by salary) from employees;

select *, max(salary) over(partition by dept order by hire_year) from employees;

-- partition be can also be used on two columns
select *, sum(salary) over(partition by dept, hire_year) from employees;

-- using case with widows over (partition by )function 
select *, avg(salary) over(partition by dept),
case
   when salary>avg(salary) over(partition by dept) then 'above avg salary'
   else 'less then avg salary'
   end
   from employees;

-- row() is a windows fumction which gives unique number to every row   
select *, row_number() over() from employees;

select *, row_number() over(order by emp_id) from employees;

select *, row_number() over(partition by dept) from employees;

-- rank() is also windows function which gives rank according to the order by values
select *, rank() over() from employees;

select *, rank() over(order by salary) from employees;

-- rank according  to the salary every department
select *, rank() over(partition by dept order by salary) from employees;

-- rank according  to the hire_year every department
select *, rank() over(partition by dept order by hire_year) from employees;