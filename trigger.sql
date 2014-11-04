set serveroutput on;
CREATE OR REPLACE TRIGGER student_bi 
BEFORE INSERT on student
FOR EACH ROW
DECLARE
v_student_id STUDENT.STUDENT_ID%TYPE; 
BEGIN
SELECT max(student_id)+1 INTO v_student_id from student;
:NEW.student_id := v_student_id; 

if :NEW.created_by is null then
  :NEW.created_by := USER; 
end if;
:NEW.created_date := SYSDATE; 
:NEW.modified_by := coalesce(:NEW.modified_by,USER); 
:NEW.modified_date := SYSDATE;
END;
/

insert into student (STUDENT_ID,SALUTATION) values (34,'Mr');

describe student;
select * from STudent order by STUDENT_ID desc;


create table statistics
	(
		TABLE_NAME VARCHAR2(30),
		TRANSACTION_TYPE VARCHAR2(10),
		TRANSACTION_USER VARCHAR2(30),
		TRANSACTION_DATE DATE
	);


CREATE OR REPLACE TRIGGER instructer_logger 
BEFORE update or delete on instructor
DECLARE
V_TRANSACTION_TYPE VARCHAR2(10);
v_STATISTICS STATISTICS%ROWTYPE; 
PRAGMA AUTONOMOUS_TRANSACTION;

BEGIN
  IF (UPDATING) THEN
    V_TRANSACTION_TYPE := 'UPDATE';
  ELSE 
    V_TRANSACTION_TYPE := 'DELETE';
  END IF;
  SELECT * INTO v_STATISTICS FROM STATISTICS WHERE TRANSACTION_USER = USER;
  if SQL%rowcount = 0 then
    insert into STATISTICS values('INSTRUCTOR',V_TRANSACTION_TYPE ,USER,SYSDATE);
  ELSE
    UPDATE STATISTICS SET TRANSACTION_TYPE = V_TRANSACTION_TYPE WHERE TRANSACTION_USER = USER;
  end if;
  COMMIT;
  
END;
/
SELECT * FROM STATISTICS;
select * from instructor;

UPDATE INSTRUCTOR SET INSTRUCTOR_ID = 121 WHERE INSTRUCTOR_ID = 111;
DELETE FROM INSTRUCTOR WHERE INSTRUCTOR_ID = 121;



describe instructor;

ROLLBACK;
CREATE OR REPLACE TRIGGER instructer_info 
BEFORE INSERT on instructor
for each row
DECLARE
  V_ZIP VARCHAR2(5);
BEGIN
  :NEW.created_by := USER; 
  :NEW.created_date := SYSDATE; 
  :NEW.modified_by := coalesce(:NEW.modified_by,USER); 
  :NEW.modified_date := SYSDATE;
  IF(:NEW.ZIP IS NULL) THEN
    RAISE_APPLICATION_ERROR(-20010, 'Zip field is compulsory.');
  end if;
END;
/
select * from instructor;
insert into instructor (INSTRUCTOR_ID,SALUTATION,ZIP,PHONE) values (112,'Mr.','23','1234');
insert into instructor (INSTRUCTOR_ID,SALUTATION,PHONE) values (113,'Mr.','1234');

SELECT SYSDATE FROM DUAL;

SELECT TO_CHAR(TO_DATE('2003/07/09', 'yyyy/mm/dd'),'D') FROM DUAL;


CREATE OR REPLACE TRIGGER section_biu 
AFTER INSERT OR UPDATE ON section 
--FOR EACH ROW
DECLARE

v_total NUMBER;
v_name VARCHAR2(30); 

BEGIN
	SELECT COUNT(*) INTO v_total
	FROM section
	WHERE instructor_id = :NEW.instructor_id;
	-- check if the current instructor is overbooked 

	IF v_total >= 10 THEN

		SELECT first_name||' '||last_name INTO v_name
		FROM instructor
		WHERE instructor_id = :NEW.instructor_id;

		RAISE_APPLICATION_ERROR(-20000, 'Instructor, '||v_name||', is overbooked');
	END IF; 

	EXCEPTION
		WHEN NO_DATA_FOUND THEN 
			RAISE_APPLICATION_ERROR(-20001, 'This is not a valid instructor'); 
END;
/

UPDATE section SET INSTRUCTOR_ID = 101 WHERE section_id = 80;
select * from section WHERE section_id = 80;
select * from instructor;
select * from section WHERE instructor_id = 101;