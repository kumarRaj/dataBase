CREATE VIEW instructor_summary_view AS
SELECT i.instructor_id, COUNT(s.section_id) total_courses
FROM instructor i
LEFT OUTER JOIN section s
ON (i.instructor_id = s.instructor_id) GROUP BY i.instructor_id;

delete from instructor_summary_view where instructor_id = 111;
drop trigger INSTRUCTER_LOGGER;
select * from all_views;
rollback;
CREATE OR REPLACE TRIGGER instructor_summary_del 
INSTEAD OF DELETE ON instructor_summary_view
FOR EACH ROW
BEGIN
	DELETE FROM instructor
	WHERE instructor_id = :OLD.INSTRUCTOR_ID;
END;
/

describe student;
describe zipcode;

create view stud_address as
select s.STUDENT_ID,s.FIRST_NAME,s.LAST_NAME,s.STREET_ADDRESS,s.ZIP,z.city,z.state from student s,zipcode z where s.zip = z.zip;

CREATE OR REPLACE TRIGGER stud_address_insert 
INSTEAD OF INSERT ON stud_address
FOR EACH ROW
declare v_zip varchar(5);
available number;
BEGIN
  v_zip := :NEW.ZIP;
  select count(*) into available from zipcode where zip = v_zip;
  if (available = 1)then
    INSERT INTO STUDENT(STUDENT_ID,FIRST_NAME,LAST_NAME,STREET_ADDRESS,ZIP) VALUES 
    (:NEW.STUDENT_ID,:NEW.FIRST_NAME,:NEW.LAST_NAME,:NEW.STREET_ADDRESS,:NEW.ZIP);
    else RAISE_APPLICATION_ERROR(-20017, 'Zipcode is invalid.');
  end if;
	
END;

CREATE OR REPLACE TRIGGER stud_address_insert 
INSTEAD OF INSERT ON stud_address
FOR EACH ROW
declare v_zip varchar(5);
available number;
BEGIN
  v_zip := :NEW.ZIP;
  select count(*) into available from zipcode where zip = v_zip;
  if (available <> 1)then
    insert into zipcode (ZIP,city,state) values (:NEW.ZIP,:NEW.CITY,:NEW.STATE)
  end if;
  INSERT INTO STUDENT(STUDENT_ID,FIRST_NAME,LAST_NAME,STREET_ADDRESS,ZIP) VALUES 
    (:NEW.STUDENT_ID,:NEW.FIRST_NAME,:NEW.LAST_NAME,:NEW.STREET_ADDRESS,:NEW.ZIP);
END;



select * from stud_address where STUDENT_ID = 404;

select * from student order by student_id desc;
select * from zipcode;
INSERT INTO stud_address (FIRST_NAME,LAST_NAME,STREET_ADDRESS,zip)VALUES ('rAM','Kumar','asd','11101');