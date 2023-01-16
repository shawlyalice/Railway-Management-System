create or replace trigger changeticketCount
after insert or update on booking
for each row

declare
	tkt_count number;
	bk_status varchar2(20);
	
begin
	select count_ into tkt_count 
			from ticket where ticketid = :new.ticketid;
	
	if :new.booking_status = 'Booked'
		then 
			update ticket set count_ = tkt_count-1 where ticketid = :new.ticketid;
			--commit; not allowed to commit inside trigger  
	end if;
	
	if :new.booking_status = 'Canceled'
		then
			update ticket set count_ = tkt_count+1 where ticketid = :new.ticketid;
			--commit; where to commit though? inside function I guess
	end if;
end;
/


create or replace trigger changeticketStatus
after update 
of count_
on ticket
for each row

begin
	if :new.count_ = 0
		then 
			update ticket set status_ = 'unavailable' where ticketid = :new.ticketid;
			-- cannot change table on which trigger is called inside trigger :(
			-- mutating error
	end if;
	
	if :old.count_ = 0  and :new.count_ >0
		then 
			update ticket set status_ = 'available' where ticketid = :new.ticketid;
	end if;
end;
/