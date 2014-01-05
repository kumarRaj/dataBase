use test;
create table STEP_students(id smallint,name text(25));
alter table STEP_students add column phone_No char(1);
describe STEP_students;
select * from STEP_students;
insert into STEP_students values(5,'RajaRam mohan Roy');
rollback;
drop table STEP_students;
help contents;