set serveroutput on;
set verify off;

declare
	tname train.tname%type := '&train_name';
	source train.source%type := '&source';
	destination train.destination%type := '&destination';
	seats train.seats%type := '&total_seats';
	v_msg varchar2(30);
begin
	v_msg := addTrain(tname, source, destination, seats);
end;
/