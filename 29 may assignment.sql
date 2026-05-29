-- 1
use sakila;
select department,count(emp_id) as emp_count from employees
group by department;

-- 2
select department, round(avg(salary),1) as avg_salary from employees
group by department
having avg(salary)>60000;

-- 3
select department,sum(salary) as total_salary
 from employees
group by department
order by total_salary desc;

-- 4
select department, count(emp_id), round(avg(salary),2) as avg_salary
from employees
group by department
having count(*)>4
and avg(salary)>55000;

-- 5
select customer_id,
count(*) as order_count,
sum(order_amount) as total_amount
from orders
group by customer_id
having count(*) > 2
and sum(order_amount) > 5000;

-- topic 2
-- 6
select c.customer_name,
count(o.order_id) as order_count
from customers as c
join orders as o
on c.customer_id = o.customer_id
group by c.customer_name;

 -- 7
 select p.product_name,
sum(o.price) as total_revenue
from products as p
join orders as o
on p.product_id = o.product_id
group by p.product_name;

-- 8
select category,
sum(stock_qty) from products
group by category;

-- 9
select c.customer_name, c.city,
sum(o.amount) as total_spend
from customers  as c
join orders as o
on c.customer_id = o.customer_id
group by c.customer_name, c.city
having sum(o.amount) > 3000;

-- 10

-- topic 3
-- 11
select e.emp_name,
case 
	when m.emp_name is null then 'No Manager'
	else m.emp_name
end as manager_name
from employees e
left join employees m
on e.manager_id = m.emp_id;

-- 12
select e.emp_name as emp_name,
e.salary as emp_salary,
m.emp_name as manager_name,
m.salary as manager_salary
from employees e
join employees m
on e.manager_id = m.emp_id
where e.salary > m.salary;

-- 13
select e.emp_name,e.department
from employees e
join employees m
on e.manager_id = m.emp_id
where m.emp_name = 'Alice Johnson';

-- 14

-- 15

-- topic 4
-- 16
select emp_name,salary
from employees
where salary > (select avg(salary) from employees);

-- 17
select emp_name, department, salary
from employees
where salary = (select max(salary) from employees);

-- 18
select product_name, price
from products
where price > (select avg(price) from products 
where category = 'Electronics'
);

-- 19

-- 20
select order_id, customer_id, amount
from orders
where amount > (select avg(amount) from orders);

-- topic 5
-- 21
select emp_name,department, salary
from employees
where department = any (select department
from employees where salary > 75000);

-- 22
select product_name, category, price
from products
where price < all (select price
from products where category = 'Furniture');

-- 23
select customer_name, customer_id, city
from customers
where customer_id in (select customer_id from orders);

-- 24
select empl_name, department, salary
from employees
where salary > any (select salary from employees
where department = 'HR');

-- 25
