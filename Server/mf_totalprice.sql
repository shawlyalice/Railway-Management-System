set serveroutput on;
set verify off;

declare
	price number;
begin
	price := getTotalPrice(price);
	dbms_output.put_line('Total Price of tickets sold: ' || price || ' taka');
end;
/

