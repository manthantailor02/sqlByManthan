-- Find total sales by each department.

select employee_name,department,sales_amount,
 sum(sales_amount) over(partition by department order by employee_name) as total_sales from employees_sales;

-- Find average sales per employee.
select employee_name,sales_amount,
 avg(sales_amount) over(partition by employee_name) as avg_sales
from employees_sales;

-- Rank employees by sales within each department.
select employee_name,sales_amount, department,
 rank() over(partition by department order by sales_amount desc) as sales_rank
 from employees_sales;
 
 -- Find previous sale amount for each employee.
 select * from employees_sales;
 select employee_name, sale_date, sales_amount,
 lag(sales_amount,1) over(PARTITION BY employee_name
ORDER BY sale_date) as prev_sales
 from employees_sales;