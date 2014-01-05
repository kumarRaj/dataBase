SELECT * FROM student;
delete from student where id = 5;
update student set subject2=55 where id = 11;
ALTER TABLE `student`
	ADD COLUMN `maxMarks` INT(11);
update student set maxMarks=100;
select name as Name,subject1+subject2 as Marks from student;
INSERT INTO student (id,name,dateOfBirth,gender,date_Of_Joining,address_line1,address_line2,subject1,subject2) VALUES(59,'Guru','2000-12-2','F','2006-8-5','876','Block 89',5,90);
ALTER TABLE `student`
	ADD COLUMN `City` VARCHAR(50) NOT NULL DEFAULT 'Indonesia' AFTER `address_line2`;
select count(*) from student;
select SUM(subject1) from student;
select SUM(subject1)/count(*) as AVERAGE from student;
select AVG(subject1) as AVERAGE from student;
select count(*) Pass_in_subject1 from student where (subject1 >= 60)
select * from student where (subject1 >= 60)
select count(*) Pass_in_subject2 from student where (subject2 >= 60)
select id,name,subject1,subject2 from student where (subject1 >= 50 and subject2 >= 50)