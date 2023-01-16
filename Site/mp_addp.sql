set serveroutput on;
set verify off;

declare
	pname passenger.pname%type := '&name';
	gender passenger.gender%type := '&gender';
	age passenger.age%type := &age;
	city passenger.city%type := '&city';

begin
	addPassenger(pname, gender, age, city);
end;
/

select * from passenger;