set serveroutput on;
set verify off;

declare
	d train.destination%type := '&destination';

begin
	findCheapestTrains(d); 
end;
/