select name,subject1,subject2,
		if(subject1>subject2, subject1,subject2) as greater
		from student;
/*
if(subject1>subject2) then
	select subject1 from student;
	else
		select subject1 from student;
end if
*/
select subject1 from student;

SELECT subject1,CASE
	 WHEN subject1>55 THEN 'A+'
	 WHEN subject1>49 THEN 'B+'	 
	 WHEN subject1=48 THEN 'B-'
	 ELSE 'Fail'
	 END as g
	 from student;
	 
/* if exp1 = exp2 then null*/
select NULLIF(3,3)

/* if not equal then exp1*/
select NULLIF(3,3)

/* if exp1 not null then exp1*/
select IFNULL(3,3)

/* if exp1 null then exp2*/
select IFNULL(NULL,3)

describe SELECT subject1,CASE subject1
	 WHEN 50 THEN 50
	 WHEN 60 THEN 60
	 ELSE 'NOT FOUND' END as g
	 from student;