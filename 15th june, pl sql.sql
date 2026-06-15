declare
   x int := 9;
   n int := 1;
   y varchar(30);
   a varchar(30);
   b varchar(30);
   c hr.employees.first_name%type;

begin
   dbms_output.put_line('hello world');
   dbms_output.put_line('i''m manthan');

   dbms_output.put_line(x);

   if x > 0 then
      dbms_output.put_line('positive');
   else
      dbms_output.put_line('negative');
   end if;

   while n <= 5 loop
      dbms_output.put_line(n);
      n := n + 1;
   end loop;

select first_name, last_name,email into y,a,b
         from hr.employees where employee_id=150;
         dbms_output.put_line(y);
         dbms_output.put_line(a);
         dbms_output.put_line(b);

select first_name into c
        from hr.employees where employee_id=200;
         dbms_output.put_line(c);
end;