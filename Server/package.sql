create or replace package myPackage as 

	function cancelTicket(bkingid in number)
		return varchar2;

	function bookTicket(pid in number, tktid in number, stype in varchar2, location in varchar2)
		return varchar2;
end myPackage;
/

--package 
create or replace package body myPackage as 

	function cancelTicket(bkingid in number)
	return varchar2
	is
	
cnt number;

begin
	
	update booking set booking_status = 'Canceled' where bid = bkingid;	
	commit;		
	
	select count_ into cnt from ticket 
		where ticketid = 
			(select ticketid from booking where bid = bkingid);
			
	if cnt = 1
		then 
			update ticket set status_ = 'available' where 
				ticketid =
				(select ticketid from booking where bid = bkingid);
	end if;
			
	
	commit;
	return 'Canceled';
	end cancelTicket;
		

	function bookTicket(pid in number, tktid in number, stype in varchar2, location in varchar2)
		return varchar2
		is
		
	tkt_status varchar2(30);
	cnt number;
	tkt_unavailable exception;
	pd number ;

	begin
		select pid into pd from passenger where pid = pid ;
		select status_ into tkt_status from ticket where ticketid = tktid; 
		if tkt_status = 'available'
			then
				insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
					values ((select max(bid)+1 from booking), pid, tktid, 
							(select max(seat_num)+1 from booking), stype, 'Booked', location);
				commit;
				
				select count_ into cnt from ticket where ticketid = tktid;
		
				if cnt = 0
					then 
					update ticket set status_ = 'unavailable' where ticketid = tktid;	
				end if;
				
				commit;		
			return 'Ticket Booked';
			
		else
			raise tkt_unavailable ;
		end if;
	exception 
		when tkt_unavailable then return 'Ticket Unavailable';
		when no_data_found then return 'No such Passenger';
	end bookTicket;
end myPackage;
/
