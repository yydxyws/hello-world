use test;
create table student(
id integer,
name varchar(8),
password varchar(20));
drop table new_table;
rename table student to stu;
alter table stu add age integer;

alter table stu change password pwd varchar(8);