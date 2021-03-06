SELECT * FROM STUDENT S WHERE S.SID IN (SELECT SID FROM APPLY WHERE APPLY.MAJOR='CS');

SELECT S.SID,S.SNAME,A.CNAME FROM STUDENT S INNER JOIN APPLY A ON S.SID = A.SID AND A.MAJOR='CS';

--nAMES OF STUDENTS WHO APPLIED TO CS
SELECT SNAME FROM STUDENT S WHERE S.SID IN (SELECT SID FROM APPLY WHERE APPLY.MAJOR='CS');


--Gpas of all cs applicants

SELECT * FROM STUDENT;

SELECT SNAME,GPA from student WHERE SID IN (SELECT SID FROM apply WHERE major='CS');

--sTUDENTS WHO APPLIED FOR CS BUT NOT EE

SELECT * FROM APPLY WHERE MAJOR = 'CS' AND MAJOR <> 'EE';

SELECT SID FROM APPLY WHERE MAJOR = 'CS'
  MINUS
SELECT SID FROM APPLY WHERE MAJOR = 'EE';

SELECT SNAME,GPA from student WHERE SID IN (SELECT SID FROM APPLY WHERE MAJOR = 'CS'
  MINUS
SELECT SID FROM APPLY WHERE MAJOR = 'EE');

SELECT SNAME,GPA from student WHERE SID IN (SELECT SID FROM APPLY WHERE MAJOR = 'CS'
  MINUS
SELECT SID FROM APPLY WHERE MAJOR = 'EE') ;

SELECT SNAME,GPA from student WHERE SID = ANY (SELECT SID FROM APPLY WHERE MAJOR = 'CS') AND SID NOT IN (SELECT SID FROM APPLY WHERE MAJOR = 'EE');

--I want list of colleges such that there is at least one more college in that state.

(select C1.STATE,COUNT(C1.STATE) from college C1 GROUP BY C1.STATE);
--todo


--Biggest COLLEGE IN TERMS OF ENROLLMENT

--STUDENT IN HIGHEST GPA
SELECT * FROM STUDENT;

SELECT * FROM APPLY;

SELECT S1.* FROM STUDENT S1 WHERE NOT EXISTS (SELECT S2.GPA FROM STUDENT S2 WHERE S1.GPA < S2.GPA);

SELECT C1.* FROM COLLEGE C1 WHERE NOT EXISTS (SELECT C2.ENROLLMENT FROM COLLEGE C2 WHERE C1.ENROLLMENT < C2.ENROLLMENT);

SELECT * FROM STUDENT S1 WHERE GPA >= ALL (SELECT GPA FROM STUDENT);

SELECT CNAME FROM COLLEGE S1 
WHERE NOT ENROLLMENT <= ANY (SELECT ENROLLMENT FROM COLLEGE S2 WHERE S2.CNAME <> S1.CNAME);


SELECT CNAME FROM COLLEGE S1 
WHERE ENROLLMENT >= ALL (SELECT ENROLLMENT FROM COLLEGE S2);


--STUDENTS NOT FROM SMALLEST HIGH SCHOOL

SELECT * FROM STUDENT WHERE SIZEHS > 200;

SELECT SIZEHS FROM STUDENT S1 WHERE SIZEHS <= ALL (SELECT SIZEHS FROM STUDENT);

SELECT SIZEHS FROM STUDENT S1 WHERE SIZEHS <= ALL (SELECT SIZEHS FROM STUDENT);

SELECT * FROM STUDENT S1 WHERE EXISTS (SELECT * FROM STUDENT S2 WHERE S1.SIZEHS > S2.SIZEHS);

SELECT * FROM STUDENT WHERE SIZEHS > ANY (SELECT SIZEHS FROM STUDENT S1 WHERE SIZEHS <= ALL (SELECT SIZEHS FROM STUDENT));


--gROUP BY
--hAVING
--MATH,FUNCTIONS
--VIEWS