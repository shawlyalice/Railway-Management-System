set serveroutput on;
set verify off;

declare
	d train.destination%type := '&destination';

begin
	findTrain(d); 
end;
/