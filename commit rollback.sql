select * from student
alter table student drop column date_of_joining
UPDATE STUDENT SET SUBJECT1 = 50 , SUBJECT2 = 50
ALTER TABLE STUDENT ADD COLUMN TOTAL INT DEFAULT 250
rollback
COMMIT
ALTER TABLE `student`
	CHANGE COLUMN `maxMarks` `maxMarks` INT(11) DEFAULT '100' AFTER `subject5`;

INSERT INTO STUDENT (id,name,subject1,subject2) VALUES(62,'Vishal',50,50)

update student set subject3 = subject3 + 11 where id % 2 = 0 
commit
rollback
select id,name,subject1,subject2,subject3,subject4,subject5 from student where id % 2 = 0 
update student set name = 'Ande samiksha' where id = 29 

update student set subject5 = subject5 + 20,subject4 = subject4 * 3 - 90 where name like 'a%'
select id,name,subject1,subject2,subject3,subject4,subject5 from student where name like 'a%'
commit


select id,name,subject1,subject2,subject3,subject4,subject5 
	from student
	where id % 3 = 0 or id % 5 = 0
update student 
	set subject1 = subject1 + 5, 
	subject2 = subject2 + 7, 
	subject3 = subject3 - 4,
	subject4 = subject4 + 21,
	subject5 = (subject5 + 230)/3
	where id % 3 = 0 or id % 5 = 0;
commit;

rollback

select id,name,subject1 
	from student 
	where subject1 >= 60
	order by subject1 desc 

select id,name,subject2 
	from student 
	where subject2 >= 60 and subject2 <= 70 
	order by subject2 desc 	
	
select id,name
	from student 
	where subject1 = 100 or subject2 = 100 or subject3 = 100 
			or subject4 = 100 or subject5 = 100 
			
update student 
	set subject1 = 100
	where subject1 > 100;

select subject1,count(subject1) as numberOfPeople
	from student
	group by subject1;

select subject2,subject1 as numberOfPeople
	from student
	group by subject2;
