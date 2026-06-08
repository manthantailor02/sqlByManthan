-- recursive cte is sql query that repeates it self untill the condition is met
create database userdb2;
use userdb2;
select * from sakila.actor where actor_id
between 1 and 3;

select * from sakila.actor where actor_id
in (3,5);

select * from sakila.actor where actor_id
between 1 and 3
union all                                  -- union all cibine results and keeps duplicates
select * from sakila.actor where actor_id
in (3,5);

select * from sakila.actor where actor_id
between 1 and 3
intersect                                 -- returns only the rows present in both queries
select * from sakila.actor where actor_id
in (3,5);

select * from sakila.actor where actor_id
between 1 and 3
except                                   -- returns rows from the first query that are not present in the second query.
select * from sakila.actor where actor_id
in (3,5);

with cte as
(select 1 as n)
select n from cte;

with cte as
(select 1 as n)

select n+5 from cte;

with cte as
(select 1 as n)

select n+5 from cte
where n<10;

with recursive cte as -- recursive table
(select 1 as n
union all
select n+2 from cte
where n<9)

select * from cte;

create table employee3( emp_id int, emo_bame varchar(50), manager_id int);

insert into employee3 values
(1, 'CEO',null),
(2, 'john',1),
(3, 'mary',1),
(4, 'david',2),
(5, 'lisa',2),
(6, 'tom',4);

select * from employee3;

with cte as 
(select * from employee3
where manager_id is null)

select * from cte;

with cte as 
(select emp_id as bid, emo_bame as bname, emo_bame as hireachy from employee3
where manager_id is null)

select emp.emp_id,emp.emo_bame, concat(emp.emo_bame, '-->', cte.bname)
as hireachy from employee3 as emp
join cte where emp_id=2 and emp.manager_id=cte.bid;
-- john ka or ceo ke bich ka relationship mil gya

with cte as 
(select emp_id as bid, emo_bame as bname, emo_bame as hireachy from employee3
where manager_id is null)

select emp.emp_id,emp.emo_bame, concat(emp.emo_bame, '-->', cte.bname)
as hireachy from employee3 as emp
join cte where emp.manager_id=cte.bid;
-- marry ka bhi mil gya
 
 -- union all krke sabke managers nikanlte handler
 with recursive cte as 
(select emp_id as bid, emo_bame as bname, emo_bame as hireachy from employee3
where manager_id is null

union all
select emp.emp_id,emp.emo_bame, concat(emp.emo_bame, '-->', cte.bname)
as hireachy from employee3 as emp
join cte where emp.manager_id=cte.bid)

select * from cte;

-- abhi sabki or detailis me bname aa rha jabki expected out
-- put me hireachy chahiye
 with recursive cte as 
(select emp_id as bid, emo_bame as bname, emo_bame as hireachy from employee3
where manager_id is null

union all
select emp.emp_id,emp.emo_bame, concat(emp.emo_bame, '-->', cte.hireachy)
as hireachy from employee3 as emp
join cte where emp.manager_id=cte.bid)

select * from cte;

-- this was the expected output withh all employees, with their managers's details
-- and hireachy


 
 
