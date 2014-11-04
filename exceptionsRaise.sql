set serveroutput on;
declare

e_exception exception;

begin
	--inner block
	begin
		raise e_exception;

		exception
			when e_exception then
				raise;
	end;

	exception
		when e_exception then
			dbms_output.put_line('An error has occured');
end;
/


