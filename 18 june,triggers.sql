/*--  triggers in pl/sql-->          which auto matically executes when some event occures in table
create trigger trigger_name, 
--1. statement level trigger=> fired only once per statement
2. row level trigger=> fired for each row inthe table(use for each row statement before begin


--create table jun18 as select * from hr.employees;

--update jun18 set first_name='tushar' where employee_id=101;
--select * from jun18;


--create table time_trigger (current_date timestamp default current_timestamp);
--update jun18 set first_name='tushar' where employee_id=103;
--select * from TIME_TRIGGER;

--create table time_trigger (current_date timestamp default current_timestamp);
--update jun18 set first_name='tushar' where employee_id=103;
--select * from TIME_TRIGGER;
--update jun18 set first_name='aman' -- will update the time in time trigger table for each row(all rows updated time at once)
/*
create table table_entry

(id int, old_value varchar(20), new_value varchar(20));
select * from table_entry;
update jun18 set first_name='abhi' where employee_id=101;

create table new_emp
(old_fname varchar(40),
new_fname varchar(40),
old_lname varchar(40),
new_lname varchar(40),
timeon timestamp);
select * from new_emp;
update jun18
set first_name = 'manthan',
    last_name = 'tailor'
where employee_id = 205;
select * from jun18;


/*create or replace trigger jun_trigger
before UPDATE
on jun18
BEGIN

   -- dbms_output.put_line('___trigger calling___');
     insert into TIME_TRIGGER values(current_timestamp);

end;


create or replace trigger jun_trigger
before UPDATE
on jun18
for each row
BEGIN

   -- dbms_output.put_line('___trigger calling___');
     insert into TIME_TRIGGER values(current_timestamp);

end;


create or replace trigger tg_jun_update
after update on jun18
for each row
BEGIN

   -- dbms_output.put_line('___trigger calling___');
     insert into TIME_entry(id,old_value, new_value)
      values(:old.employee_id, :old.first_name, :new.first_name);

end;

-- cerate a trigger jo tumare liye id, vo user ka name, old value and new value of first name and last name,last colum should be of time on which we made the changes
*/
/*
create or replace trigger new_trg_emp
after update on june18
for each row
BEGIN

insert into NEW_EMP(old_fname,new_fname,old_lname,new_lname,timeon)
values(old.first_name,new.first_name,old.last_name,new.last_name);

end;

*/



















*/
















*/