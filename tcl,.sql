/* TCL->transection control language
transition are group of sql statments which works as a unit.
thsie tcl command ensure that my data is correct and accurate by fillowing these 4 properties->
1.a-> atomicity: all or nothing
2.c->consistency
3.i->isolation: transaction separate
4.d->durability
*/
create database rajdb;
use rajdb;
create table raj45(id int);
insert into raj45 values(10);
select * from raj45; -- if i start a new server the info of table will same in the other server as well(consistancy)

-- tcl
start transaction; -- after transaction if i start a new server the info of table will not be same in the other server'table
insert into raj45 values(100),(99);
select * from raj45;
commit; -- but now because of commt it will go in consistant way gaian and the info of table will same in the other server as well

/* transaction ko start krne ke tarike:
transaction ko end krne ke liye commit, roll back ya fir koi ddl statement ko execute krege*/

SET SQL_SAFE_UPDATES = 0;
start transaction;
update raj45 set id=500;
delete from raj45;
select * from raj45;
rollback; -- update se phle ki value la deta h


start transaction;
insert into raj45 values (10),(90), (21),(56);
delete from raj45 where id=10;
select * from raj45;
commit;
rollback;


start transaction;
insert into raj45 values (768),(500), (400);
select * from raj45;
update raj45 set id=1000;
rollback;

start transaction;
insert into raj45 values (768),(500), (400);
select * from raj45;

savepoint raj45_savepoint_ins;
update raj45 set id=1000;
rollback to raj45_savepoint_ins; -- rollback to specific save point

create table tr(id int);
/* delete- DELETE ek DML (Data Manipulation Language) command hai jo table se specific rows ya saari rows
 ko permanently remove karta hai. Isme WHERE clause use karke condition laga sakte ho.
 delete rollback kr skte handler
 
 -- main diff->>> drop or truncate me rollback nhi kr skte
 
 
