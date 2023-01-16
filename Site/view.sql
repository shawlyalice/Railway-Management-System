create or replace view bookingview as
	(select * from booking) union (select * from booking@site_link); 

create or replace view passengerview as
	(select * from passenger) union (select * from passenger@site_link);