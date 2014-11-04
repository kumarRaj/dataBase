set serveroutput on;
declare cursor student_name
  is SELECT * FROM student;
  studentData student%rowtype;
  countING number;
  is_cursor_open boolean;
  
  begin 
--    countING := 1;
    open student_name;
    loop
      fetch student_name into studentData;
      dbms_output.put_line(studentData.Salutation || studentData.FIRST_NAME || ' ' || studentData.last_NAME);
--      exit when countING = 5;
--      dbms_output.put_line(student_name%rowcount);
      exit when student_name%rowcount = 5;
      is_cursor_open := student_name%isopen;
      if is_cursor_open then
        dbms_output.put_line('Open');
      end if;
--      countING := countING + 1;
    end loop;
    close student_name;
    is_cursor_open := student_name%isopen;
    if is_cursor_open = false then
        dbms_output.put_line('CLosed');
    end if;
  end;
  
  select * from zipcode;
  describe zipcode;

  declare
    abc varchar(24);
    v_city varchar(24);
  begin 
  SELECT city into v_city FROM zipcode where zip = '&Enter_City';
    if sql%rowcount = 1 then
      dbms_output.put_line(v_city);
    end if;
    
    exception when no_data_found then
      dbms_output.put_line('No data Found');
  end;


declare

v_sid student.student_id%type;

cursor c_student is
	select student_id
	from student
	where student_id > 110;

begin
	open c_student;

	loop
		fetch c_student into v_sid;
		exit when not c_student%found;
		dbms_output.put_line('Student Id : '||v_sid);
	end loop;
    
    close c_student;

    exception
    	when others then 
    		if c_student%isopen then
    			close c_student;
    		end if;
end;
/

/*cursor for loop*/


create table table_log
	(description varchar2(250));
declare
cursor c_student is
	select student_id, last_name, first_name
	from student
	where student_id > 110;

begin
	for r_student in c_student
		loop
			insert into table_log values(r_student.last_name);
		end loop;
end;
/
-- SECTION, ENROLLMENT,


SELECT COURSE_NO FROM COURSE_REVENUE WHERE NUM_ENROLLED >= 8;
SELECT * FROM ENROLLMENT;

declare
cursor c_COURSE is
SELECT * FROM course WHERE COURSE_NO IN (SELECT COURSE_NO FROM COURSE_REVENUE WHERE NUM_ENROLLED > 8);

begin
	for r_COURSE in c_COURSE
		loop
      UPDATE COURSE SET COST = (0.85 * r_COURSE.COST) WHERE COURSE_NO = r_COURSE.COURSE_NO;
--			dbms_output.put_line(r_COURSE.COURSE_NO);
		end loop;
end;
/

ROLLBACK;







/*Nested Cursors*/

declare
v_zip zipcode.zip%type;
v_student_flag char;

cursor c_zip is
	select zip, city, state
	from zipcode
	where state = 'CT';

cursor c_student is 
	select first_name, last_name
	from student
	where zip = v_zip;

begin
	for r_zip in c_zip
		loop
			v_student_flag := 'N';
			v_zip := r_zip.zip;

			dbms_output.put_line('Students living in '||r_zip.city);

			for r_student in c_student loop
				dbms_output.put_line(r_student.first_name||' '||r_student.last_name);
				v_student_flag := 'Y';
			end loop;

			if v_student_flag = 'N' then
				dbms_output.put_line('No students for this zipcode');
			end if;
		end loop;
end;
/

declare
v_student_id student.student_id%type;
v_student_flag char;

cursor c_student is select student_id, first_name,last_name  from STUDENT WHERE student_id < 110;
--cursor c_section is 
select * from section, course, enrollment, student where section.COURSE_NO = course.COURSE_NO 
              and student.STUDENT_ID IN (select student_id  from STUDENT WHERE student_id < 110);
begin

select * from section, course where section.COURSE_NO = course.COURSE_NO;
--select student_id, first_name,last_name  from STUDENT WHERE student_id < 110;
select * from enrollment where STUDENT_ID IN (select student_id  from STUDENT WHERE student_id < 110);
select * from course;
--select student.STUDENT_ID,section.SECTION_ID  from student,section where STUDENT_ID IN (select student_id  from STUDENT WHERE student_id < 110);
--select course_no from section where SECTION_ID
--select * from section;
--select * from SECTION where SECTION_ID in (select SECTION_ID from enrollment where STUDENT_ID IN (select student_id  from STUDENT WHERE student_id < 110));
--select * from STUDENT;
--
	for a_student in c_student
		loop
			v_student_id := a_student.student_id;

			for a_section in c_section loop
				dbms_output.put_line(a_section.SECTION_ID);
				v_student_flag := 'Y';
			end loop;

			if v_student_flag = 'N' then
				dbms_output.put_line('No students for this zipcode');
			end if;
		end loop;
end;
/

/*Exercise - Write a PL/SQL block with two cursor for loops. 
  The parent cursor will call the student_id, first_name, and last_name 
  from the student table for students with a student_id less than 110 
  and output one line with this information. For each student, 
  the child cursor will loop through all the courses that 
  the student is enrolled in, outputting the course_no and the description*/


declare

cursor c_course is
	select course_no, cost
	from course for update;

begin
	for r_course in c_course loop
		if r_course.cost < 2500 then
			update course set cost = r_course.cost + 10
			where course_no = r_course.course_no;
		end if;
	end loop;
end;
/

rollback;