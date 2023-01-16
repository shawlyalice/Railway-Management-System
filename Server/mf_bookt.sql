set serveroutput on;
set verify off;

declare
	output_ varchar2(40);
	pid number := &passengerid;
	tktid number := &ticketid;
	stype varchar2(40) := '&seattype';
	location varchar2(40) := '&location';
begin
	output_ := bookTicket(pid, tktid, stype, location);
	dbms_output.put_line(output_);
end;
/