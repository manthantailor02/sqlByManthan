create database indexdb;
use indexdb;
create table employees(id int, name varchar(20), age int);

insert into employees values(1,'abc',90), (3, 'def', 100), (2, 'abhi', 23),
(5, 'naina', 7899), (6, 'shyam', 100), (4, 'tushar', 100);
select * from employees;

-- clustered index=> primary key is called as clustered index
select * from employees;
alter table employees add primary key(id);

select * from employees;

explain select * from employees where name='tushar';

-- non index clustered me duplicate aas kste h, esme physically and sorted way me store nhi hota 
-- jabki clustered me sab hota handler
-- non clustered index are those in which a saperet data structure will be created\

drop database indexdb;
create database indexdb;
use indexdb;
create table employees(id int, name varchar(20), age int);

insert into employees values(1,'abc',90), (3, 'def', 100), (2, 'abhi', 23),
(5, 'naina', 7899), (6, 'shyam', 100), (4, 'tushar', 60);
select * from employees;

show indexes from employees; -- <-- it will show the indexes on table

create index age_indx on employees(age);
explain select * from employees  where age=100;

-- composite index-- adding two columns for indexing
create index comp_index on employees(age,name);
show indexes from employees;

explain select * from employees  where age=100 and name='def';
show indexes from employees;