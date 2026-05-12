create database subquerydb;
use subquerydb;
-- Create Table
CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT
);

-- Insert Data
INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);

-- find the emp details works in it and hve the slalary > salary of emp_id 101
 select * from employees where department='it';
 select salary, emp_id from employees where emp_id=1;
 select * from employees where department='it' and salary>any( select salary from employees where emp_id=1);
 
 -- find the name of a person whose salary is>all the slaaris of hr or it dept
 select first_name, salary from employees ;
 select salary from employees where department='hr' or department='it';
 select first_name, salary from employees
 where salary>all(select salary from employees where department in ('HR','IT'));

 -- find the emp id and name of the users whose salary is> the salary of any emp working uder the manage id 101
select * from employees;
 select emp_id, NAME, salary from employees;
 select * from employees where manager_id=101;
  select emp_id, NAME, salary from employees where salary>any(select salary from employees where manager_id=101);
  
  -- second highest salary from this table
 select salary from employees;

 select max(salary) from employees;
 select max(salary) from employees where salary<( select max(salary) from employees);