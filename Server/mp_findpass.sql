set serveroutput on;
set verify off;

declare
	tname varchar2(50) := '&trainname';
	
begin
	findPassengers(tname);
end;
/