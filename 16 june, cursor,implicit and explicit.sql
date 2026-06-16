/*
cursor in pl/sql=> a cursor in pl/sql is a pointer to the memory area where oracle stores the result of a sql query.
it allows you to process query results one row at a time.

--> two types of curson=>
1. implicit cursor=> oracle automatically creates it for sql statements like
sql%rowcount → number of rows affected
sql%found → returns true if rows affected
sql%notfound → returns true if no rows affected
sql%isopen → always false for implicit cursors

note: create table raj45 as select * from hr.employees;
 above query  is used to put a data into new table

-- create table raj45 as select * from hr.employees;
-- select * from raj45;

--BEGIN   
  --   update raj45 set first_name='aman'
   --  where first_name='Neena';

     --dbms_output.put_line(sql%rowcount);
-- end;
--create table raj46 as select * from hr.employees;
--select * from raj46;

create table raj47
as select employee_id, first_name,EMAIL
from hr.employees where employee_id between 101 and 105;
select * from raj47;

declare 
    cursor raj_cursor IS
    select * from raj47;

    raj_rec raj47%rowtype;

begin 
    open raj_cursor; -- we open the file

    if(raj_cursor%isopen) THEN              -- if the cursor is open will give msg that crusor is open
       dbms_output.put_line('cursor open');
    end if;

    fetch raj_cursor into raj_rec; --task execute

    if(raj_cursor%found) THEN              -- if there are changes in cursor then it will give msg cursor is found
       dbms_output.put_line('cursor found');
    end if;

    close raj_cursor; -- we close the cursor

end;

declare 
    cursor raj_cursor IS
    select * from raj47;

    raj_rec raj47%rowtype;

begin 
    open raj_cursor; -- we open the file

    if(raj_cursor%isopen) THEN              -- if the cursor is open will give msg that crusor is open
       dbms_output.put_line('cursor open');
    end if;

    fetch raj_cursor into raj_rec; --task execute

    while(raj_cursor%found) loop             
       dbms_output.put_line(raj_rec.first_name || ' ' ||raj_rec.employee_id); -- will give first name and emp_id in front
       fetch raj_cursor into raj_rec;
    end loop;

    close raj_cursor; -- we close the cursor

end;











*/