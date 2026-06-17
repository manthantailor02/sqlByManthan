/*

create or replace function new_email(f_name varchar2,l_name varchar2)
return varchar2
is
begin
    return lower(f_name || l_name || '@gmail.com');
end;
/
select employee_id,
       first_name,
       last_name,
       new_email(first_name, last_name) as email
from hr.employees;

| feature           | procedure                                | function                                          |
| ----------------- | ---------------------------------------- | ------------------------------------------------- |
| purpose           | performs an action                       | computes and returns a value                      |
| return value      | does not return a value directly         | must return exactly one value                     |
| return statement  | optional                                 | mandatory                                         |
| calling           | called using `execute` or inside a block | can be called in expressions and sql statements   |
| parameters        | `in`, `out`, `in out`                    | usually `in` (can have others, but less common)   |
| use in sql query  | cannot be used in `select`               | can be used in `select`                           |
| data manipulation | commonly used for insert, update, delete | mainly used for calculations and value generation |
| compilation       | `create procedure`                       | `create function`                                 |
| output            | through `out` parameters                 | through `return` statement                        |









*/