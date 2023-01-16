create or replace package globalPackage as 
procedure findPassengers(namet in train.tname%type);
function getTotalPrice(x in number)
		return number;
function getTicketsSold(x in number)
		return number;
end globalPackage;
/

--package 
create or replace package body globalPackage as 
--1
procedure findPassengers(namet in train.tname%type)
	is

pid passenger.pid%type;
pname passenger.pname%type;
gender passenger.gender%type;
age passenger.age%type;

cursor curr is
	select pid, pname, gender, age from passenger
		where pid in
			(select pid from booking 
				where ticketid in 
					(select ticketid from ticket where tid in
						(select tid from train where tname=namet)
					)
			)
	union
	
	select pid, pname, gender, age from passenger
		where pid in
			(select pid from booking@site_link 
				where ticketid in 
					(select ticketid from ticket where tid in
						(select tid from train where tname=namet)
					)
			);
					
begin
	open curr;
	
	loop
		fetch curr into pid, pname, gender, age;
		exit when curr%notfound;
	
		dbms_output.put_line(pid || '	 ' || pname || '	 ' || gender || '	 '|| age); 
	end loop;
	
	close curr;
end findPassengers;
-------------------------------------------2
    function getTotalPrice(x in number)
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
---------------3
function getTicketsSold(x in number)
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
end getTicketsSold;

end globalPackage;
/