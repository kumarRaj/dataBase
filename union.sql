/* union is distinct 
	union all is not */

SELECT id,name,subject1,CASE
   WHEN subject1>55 THEN 'PASS'
   ELSE 'Fail'
   END as Grade,
   'maths' as sub_name
   from student where id = 5
union
SELECT id,name,subject1,CASE
   WHEN subject1>55 THEN 'PASS'
   ELSE 'Fail'
   END as Grade,
   'maths' as sub_name
   from student where id = 5
union
SELECT id,name,subject2,CASE
   WHEN subject2>55 THEN 'PASS'
   ELSE 'Fail'
   END as Grade,
   'science' as sub_name
   from student where id = 5
union
SELECT id,name,subject3,CASE
   WHEN subject3>55 THEN 'PASS'
   ELSE 'Fail'
   END as Grade,
   'english' as sub_name
   from student where id = 5
union
SELECT id,name,subject4,CASE
   WHEN subject4>55 THEN 'PASS'
   ELSE 'Fail'
   END as Grade,
   'environmental' as sub_name
   from student where id = 5
union
SELECT id,name,subject5,CASE
   WHEN subject5>55 THEN 'PASS'
   ELSE 'Fail'
   END as Grade,
   'Hindi' as sub_name
   from student where id = 5
select * from student