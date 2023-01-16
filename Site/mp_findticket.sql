set serveroutput on;
set verify off;

declare
	s ticket.source%type := '&source';
	d ticket.dest%type := '&destination';
	c ticket.count_%type := '&count';
	
begin
	findTicket(s, d, c);
end;
/