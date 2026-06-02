use sakila;
-- cte=> common table expression

select actor_id,count(film_id) as moviesCount
 from sakila.film_actor group by actor_id;
 
 with test as
 (select actor_id,count(film_id) as moviesCount
 from sakila.film_actor group by actor_id)
 -- cte ki madad se test naam ki nyi table/subquery bna di
 
-- select * from test-- test ko access kr liya
 
 -- movie count niklna
 select sum(moviesCount) from test where actor_id>10;
 
 use windowsdb;
 select * from 
 (select *,max(salary) over(partition by dept) as deptMax from employees) as temp where salary=deptMax;
 
 -- sql presidence order
 -- from--> where-->group by-->having--> select--> distinct--> order by--> limit/offset
 
 -- second method
 with cte as 
 (select *,max(salary) over(partition by dept) as deptMax from employees) -- ctw table bna diya
 
 select * from cte where salary=deptmax;
 
 -- third method (cte and join together)
 with xyz as 
 ( select dept, max(salary) as deptMax from employees group by dept)
 
 select * from employees 
 join xyz where employees.dept=xyz.dept and employees.salary=xyz.deptMax;
 
 
 
 
