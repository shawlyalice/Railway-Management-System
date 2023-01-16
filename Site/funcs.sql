-- FUNC 1: Book ticket
create or replace function bookTicket(pid in number, tktid in number, stype in varchar2, location in varchar2)
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
end;
/

--FUNC 2:  add Train 

create or replace function addTrain(tname in varchar2, source in varchar2, destination in varchar2, seats in number)
	return varchar2
	is
--tid number;
begin
	insert into train(tid, tname, source, destination, seats)
		values((select max(tid)+1 from train) ,tname,  source, destination, seats);
	commit;
	return 'Train added';
end;
/

--FUNC 3: cancel Booking 

create or replace function cancelTicket(bkingid in number)
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
end;
/

-- The functions written below use local data and data from another site
-- Server functions

--FUNC 4: Total tickets sold

create or replace function getTicketsSold(x in number)
		return number
		is
		
sold number := 0;

begin
	select count(*) into sold 
		from 
			((select * from booking where booking_status = 'Booked') 
				union 
			(select * from booking@site_link where booking_status = 'Booked')
			); 
	return sold; 
end;
/

--FUNC 5: Total price of sold tickets

create or replace function getTotalPrice(x in number)
		return number
		is
		
price number := 0;
tktid number;
fare number;

cursor curr1 
	is 
	(select ticketid from booking where booking_status = 'Booked') 
				union 
	(select ticketid from booking@site_link where booking_status = 'Booked')
	; 
	
cursor curr2(t number) is
	select fare from ticket where ticketid = t;
	
begin

	open curr1;
	
	loop 
		fetch curr1 into tktid;
		exit when curr1%notfound;
		
		open curr2(tktid);
		
		fetch curr2 into fare;
		price := price + fare;
		
		close curr2;
	
	end loop;		
	
	close curr1;
	
	return price;
	
end;
/


