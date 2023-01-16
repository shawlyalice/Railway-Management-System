set serveroutput on;
set verify off;

declare
	n number;
begin
	n := getTicketsSold(n);
	dbms_output.put_line('Total Tickets sold: ' || n);
end;
/