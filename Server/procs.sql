--PROC 1
--Find a train that goes to desired destination
create or replace procedure findTrain(d in varchar2)
	is
	
id number;	
name varchar2(30);
cursor curr(d varchar2) 
	is select tid, tname from train where destination = d;

begin
	open curr(d);
	
	loop
		fetch curr into id, name;
		exit when curr%notfound;
		dbms_output.put_line(id || '    ' || name);
	end loop;
	
	close curr;

end;
/

--PROC 2
--Add a passenger to the passenger table
create or replace procedure addPassenger(
		pname in passenger.pname%type, 
		gender in passenger.gender%type, 
		age in passenger.age%type, 
		city in passenger.city%type)
	is
	
begin
	insert into passenger(pid, pname, gender, age, city)
	values((select max(pid)+1 from passenger), pname, gender, age, city);
	
	commit;
end;
/

--PROC 3
--Search ticket by source, destination and number of tickets needed
create or replace procedure findTicket(
		source in ticket.source%type, 
		destination in ticket.dest%type,
		count_ in ticket.count_%type
		)
	is

ticketid ticket.ticketid%type;
tid ticket.tid%type;
fare ticket.fare%type;
dptime varchar2(40);
found number :=0;

cursor curr(s varchar2, d varchar2, c number)
	is select ticketid, tid, fare, to_char(departure_time, 'HH24:MI:SS') from ticket
		where (source=s and dest=d and count_>=c);
		
begin
	open curr(source, destination, count_);
	
	loop
		fetch curr into ticketid, tid, fare, dptime;		
		exit when curr%notfound;
		
		if found = 0
			then 
			dbms_output.put_line('Ticketid		' || 'TrainId		' || 'Fare	  ' || 'Time   ');
			found :=1;
		end if;
		
		dbms_output.put_line(ticketid || '			' || tid || '		' || fare ||'	   ' || dptime);
	end loop;
	
	close curr;
	
	if found =0
		then dbms_output.put_line('Ticket unavailable.');
	end if;
	
end;
/

-- Procedures below take local data as well as data from another site

--PROC 4
--Find all passengers of a specific train
-- Find total passenger from booking table
-- Since booking table has two fragments, results from both are combined 

create or replace procedure findPassengers(namet in train.tname%type)
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
end;
/

--PROC 5
--Find top 3 trains with cheapest tickets
create or replace procedure findCheapestTrains(d in varchar2)
	is
	
id number;	
name varchar2(30);
fare number;
cursor curr(d varchar2) 
	is 
			select distinct t.tid, t.tname, tkt.fare 
					from 
					train t join ticket tkt
						on t.tid = tkt.tid		
							where t.destination = d
							order by tkt.fare; 

begin
	open curr(d);
	
	loop
		fetch curr into id, name, fare;
		exit when curr%notfound;
		dbms_output.put_line(id || '    ' || name || '     ' || fare);
	end loop;
	
	close curr;

end;
/

--proc 6 Exception 

create or replace  procedure cancelTicketofSite(bkingid in number)
	is
cnt number;
flag number := 0 ;
permission_denied Exception; 
begin
	update booking@site_link set booking_status = 'Canceled' where bid = bkingid;
	flag =1 ;	

	if flag = 1 then raise permission_denied ;
	end if;
EXCEPTION
	when permission_denied then dbms_output.put_line("You don't have the permission");
end;
/
----7
create or replace procedure cancelTicket2(bkingid in number)
	is
	
cnt number;
loc booking.location%TYPE;
permission_denied Exception; 

begin
	select location into loc from booking where bid = bkingid;
	if loc = 'Sylhet' 
			then 
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
	elsif loc = 'Dhaka' 
			then raise permission_denied ;
	end if; 
EXCEPTION
	when permission_denied then dbms_output.put_line("You don't have the permission");
end;
/
----proc 8 
create or replace procedure findArrivaltoStation(train_name in train.tname%type)
	is 
			bal station.stname%type;
			sal troute.arrival%type;
begin
	select distinct(stname),TO_CHAR(arrival, 'dd/mm/yyyy hh24:mi:ss') into bal,sal
	from train join troute 
	on train.tid  = troute.tid 
	join station 
	on station.stid = troute.stid
	where train.tname = train_name;
end;
/