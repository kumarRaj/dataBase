set verify off;
set serveroutput on;
declare

v_student_id number := &sv_student_id;
v_enrolled varchar2(3) := 'NO';

begin
	dbms_output.put_line('Check if the student is enrolled');
	select 'YES' into v_enrolled from enrollment
	where student_id = v_student_id;

	dbms_output.put_line('The student is enrolled into one course');

	exception
		when no_data_found then
			dbms_output.put_line('The student is not enrolled');

		when too_many_rows then
			dbms_output.put_line('The student is enrolled in too many courses');
end;

declare

v_student_id number := &sv_student_id;
v_name varchar2(100);
v_total number(1);

begin

	select first_name||' '||last_name into v_name
	from student
	where student_id = v_student_id;
	dbms_output.put_line('Student name is '||v_name);
  
  begin
    select count(*) into v_total from enrollment
    where student_id = v_student_id;
    
    DBMS_OUTPUT.PUT_LINE('Student is registered for '||v_total||' course(s)');
    
    exception
      when value_error or invalid_number then
        dbms_output.put_line('An error has occured');
    end;

	exception
		when no_data_found then
			dbms_output.put_line('There is no such student');
end;
/

