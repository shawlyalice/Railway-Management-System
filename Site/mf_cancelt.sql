set serveroutput on;
set verify off;

declare
	bkingid booking.bid%type := '&booking_id';
	v_msg varchar2(30);
begin
	v_msg := cancelTicket(bkingid);
end;
/