


create database if not exists datatypedb;

use datatypedb;

create table test1(id tinyint);
insert into test1 values(-1), (10);
insert into test1 values(128); -- gives out of range error coz of tinyint(1 byte== 8 bit==2**8)(-128 to 127)

-- small int=2 byte, medium int=3 byte
-- bigint=> 8 byte

create table test2(age tinyint unsigned); -- unsigned helps to make range of tinyint from (-128-127) to (0-255)
insert into test2 values(250); -- so it wont give error

-- float decimal ke baad kuch 2 se 3 digit hi deta h jha pe double saari deta h.
create table test3(salary float, salary2 double);
insert into test3 values(11989.352472544, 11989.352472544);
select * from test3; 

create table test4(price double(6,2 )); -- total is 6, 2 is decimal, 4 are are values before the deciml
insert into test4 values(0.735167);
insert into test4 values(44.735167);
insert into test4 values(4453.735167);
insert into test4 values(4452);
insert into test4 values(044531);-- will give error coz of 5 integer values before decimal

select * from test4;

create table test5(countycode char(3));
insert into test5 values('IND');
insert into test5 values('INDIA');
insert into test5 values('he      ');

select * from test5;
select *,char_length(countycode) from test5; 

create table test6(countycode varchar(3));
insert into test6 values('IND');
insert into test6 values('INDIA');
insert into test6 values('he      ');-- error
select *,char_length(countycode) from test6; 









