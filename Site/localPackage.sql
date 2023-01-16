create or replace package localPackage as 
--1
	procedure findTrain(d in varchar2);
--2
	procedure addPassenger(
		pname in passenger.pname%type, 
		gender in passenger.gender%type, 
		age in passenger.age%type, 
		city in passenger.city%type);
--3
	procedure findTicket(
			source in ticket.source%type, 
			destination in ticket.dest%type,
			count_ in ticket.count_%type
			);
--4
		procedure findCheapestTrains(d in varchar2);
--5 
		procedure findArrivaltoStation(train_name in train.tname%type);

end localPackage;
/

--package 
create or replace package body localPackage as 
--1
	procedure findTrain(d in varchar2)
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
	end findTrain;
--2
	procedure addPassenger(
		pname in passenger.pname%type, 
		gender in passenger.gender%type, 
		age in passenger.age%type, 
		city in passenger.city%type)
	is
	
	begin
		insert into passenger(pid, pname, gender, age, city)
		values((select max(pid)+1 from passenger), pname, gender, age, city);
		
		commit;
	end addPassenger;
--3
	procedure findTicket(
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
		
	end findTicket;

--4
		procedure findCheapestTrains(d in varchar2)
			is
			
		id number;	
		name varchar2(30);
		fare number;
		cursor curr(d varchar2) 
			is 
			
		select distinct t.tid, t.tname, tkt.fare into id,name,fare
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

		end findCheapestTrains;

--5 
		procedure findArrivaltoStation(train_name in train.tname%type)
			is 
			sname station.stname%type;
			arr troute.arrival%type;
		begin
			select distinct(stname),TO_CHAR(arrival, 'dd/mm/yyyy hh24:mi:ss') into sname,arr
			from train join troute 
			on train.tid  = troute.tid 
			join station 
			on station.stid = troute.stid
			where train.tname = train_name;
		end findArrivaltoStation;

end localPackage;
/