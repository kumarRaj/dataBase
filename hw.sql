/* Sum of each subjet for each student*/
select name, subject1+subject2+subject3+subject4+subject5 as Total from student;

/* Average of each subjet */
select avg(subject1),avg(subject2),avg(subject3),avg(subject4),avg(subject5) from student;

select avg(subject1>=50),avg(subject2>=50),avg(subject3>=50),avg(subject4>=50),avg(subject5>=50) from student;
select name,count(subject3) from student where subject3<=50 group by subject3=100;
select * from student