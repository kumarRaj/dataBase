SET SERVEROUTPUT ON;
SET VERIFY OFF;
DECLARE
  v_temperature      NUMBER(5);
  v_scale            VARCHAR(2);
  v_final_temp       VARCHAR(50);
  v_final_temp_scale VARCHAR(2);
BEGIN
  v_temperature          := '&Temperature';
  v_scale                := '&Scale';
  v_scale := 5lower(v_scale);
  IF(v_scale = 'c' or v_scale = 'f') THEN
    IF(v_scale = 'c') THEN
      v_final_temp_scale := 'F';
      v_final_temp       := (v_temperature * (9/5)) + 32;
    ELSE
      v_final_temp_scale := 'C';
      v_final_temp       := (v_temperature - 32) * 5/9;
    END IF;
    DBMS_OUTPUT.PUT_LINE(v_final_temp||' '||v_final_temp_scale);
  END IF;
  EXCEPTION 
    DBMS_OUTPUT.PUT_LINE('HELLO');
END;



declare

v_temp_in number := &sv_temp_in;
v_scale_in varchar2(1) := '&sv_scale_in';
v_temp_out number;
v_scale_out varchar2(1);

begin
	if v_scale_in != 'C' or v_scale_in != 'F' then
		if v_scale_in != 'F' then
			v_temp_out := ((9*v_temp_in)/5)+32;
			v_scale_out := 'F';
		else
			v_temp_out := ((v_temp_in-32)*5)/9;
			v_scale_out := 'C';
		end if;
		dbms_output.put_line('New scale is: '||v_scale_out);
        dbms_output.put_line('New temperature is: '||v_temp_out);
  ELSE
  		dbms_output.put_line('This is not a valid scale');	
	end if;
end;
