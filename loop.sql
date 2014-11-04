SET serveroutput ON;
DECLARE
 v_number NUMBER := 1;
 v_sum    NUMBER := 0;
BEGIN
 WHILE v_number <= 10
 LOOP
   v_sum := v_sum + v_number;
   dbms_output.put_line('v_sum = '||v_sum);
   v_number := v_number + 1;
 END LOOP;
END;

DECLARE 
begin
	for v_counter in 1..5 loop
--    v_counter := v_counter + 1;
		dbms_output.put_line('v_counter = '||v_counter);
	end loop;
end;

DECLARE 
v_mum Number;
v_fact NUMBER;
begin
v_mum := &vv;
v_fact := 1;
	for v_counter in 1..v_mum loop
    v_fact := v_counter * v_fact;
	end loop;
	dbms_output.put_line('v_fact = '||v_fact);
end;

declare

v_counter1 number := 0;
v_counter2 number;

begin
	while v_counter1 < 9 loop
		dbms_output.put_line('v_counter1: '||v_counter1);
		v_counter2 := 0;
		loop
			dbms_output.put_line('v_counter2: '||v_counter2);
			v_counter2 := v_counter2 + 1;
			exit when v_counter2 >= 2;
		end loop;
		v_counter1 := v_counter1 + 1;
	end loop;
end;


declare

v_test number := 0;

begin

	for i in 1..3 loop
		dbms_output.put_line('Outer loop');
		dbms_output.put_line('i='||i);
    dbms_output.put_line('v_test='||v_test);
		v_test := v_test + 1;

		for j in 1..2 loop
			dbms_output.put_line('Inner loop');
			dbms_output.put_line('j='||j);
			dbms_output.put_line('i='||i);
			dbms_output.put_line('v_test = '||v_test);
		end loop;
	end loop;
end;


