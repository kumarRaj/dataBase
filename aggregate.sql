select * from STUDENT,COLLEGE WHERE (SELECT GPA FROM STUDENT);

select * from student INNER JOIN APPLY USING(SID);

SELECT * FROM COLLEGE;

SELECT DISTINCT A.SID,A.CNAME,S.GPA FROM aPPLY A,STUDENT S WHERE S.SID = A.SID AND GPA >= ALL (SELECT GPA FROM STUDENT S1 WHERE S.SID = A.SID);

SELECT CNAME,STATE,(SELECT DISTINCT GPA FROM APPLY,STUDENT
                    WHERE COLLEGE.CNAME = APPLY.CNAME 
                    AND APPLY.SID = STUDENT.SID AND 
                    GPA >= ALL (SELECT GPA FROM STUDENT S1 
                    WHERE Student.SID = APPLY.SID AND APPLY.CNAME = COLLEGE.CNAME))
AS GPA 
FROM COLLEGE;

select avg(gpa) from student where sid in (select sid from APPLY where APPLY.MAJOR='CS');

--sTUDENTS THAT no of students WITH SAME GPA IS EQUAKLLKT TO NUMBER OF STUDENTS WITH SAME SIZE HS

--select GPA,COUNT(GPA) from student S1 where sid in (select sid from STUDENT S2 where S1.GPA = S2.GPA) GROUP BY GPA;

--select SIZEHS,COUNT(SIZEHS) from student S1 where sid in (select sid from STUDENT S2 where S1.SIZEHS = S2.SIZEHS) GROUP BY SIZEHS;
SELECT * FROM STUDENT S WHERE 
(SELECT COUNT(*) FROM STUDENT S1 WHERE S1.SID > S.SID AND S1.GPA = S.GPA) = 

(SELECT COUNT(*) FROM STUDENT S1 WHERE S1.SID > S.SID AND S1.SIZEHS = S.SIZEHS);

--Amount by which average of students applying to CS exceeds average GPA of students not apply to 'CS'

SELECT 
(select avg(gpa) from student where sid in (select sid from APPLY where APPLY.MAJOR='CS')) -
(select avg(gpa) AS NONCSAVG from student where sid NOT in (select sid from APPLY where APPLY.MAJOR  ='CS')) AS DIFFERENCE
FROM DUAL;

SELECT CS.AVGGPA - NONCS.AVGGPA FROM
(select avg(gpa) AS AVGGPA from student where sid in (select sid from APPLY where APPLY.MAJOR='CS')) CS,
(select avg(gpa) AS AVGGPA from student where sid NOT in (select sid from APPLY where APPLY.MAJOR = 'CS')) NONCS;

SELECT (5 - 2) FROM DUAL;

SELECT STUDENT.SID,COUNT(APPLY.CNAME) FROM STUDENT,APPLY WHERE STUDENT.SID = APPLY.SID GROUP BY (STUDENT.SID)