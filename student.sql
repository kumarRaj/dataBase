create table STUDENT (roll int,name varchar(36),dateOfBirth date,gender char(1));

desc Student;
delete from student where roll = 4;
insert into student (roll,name,dateofbirth,gender) values(4,'Vivek','1994-12-2','M');
select * from STUdent order by roll;
