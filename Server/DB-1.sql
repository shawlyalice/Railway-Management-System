clear screen;

drop table train cascade constraints;
drop table station cascade constraints;
drop table passenger cascade constraints;
drop table troute cascade constraints;
drop table ticket cascade constraints;
drop table booking cascade constraints;

create table train(
	tid int,
	tname varchar2(20),
	source varchar2(20),
	destination varchar2(20),
	seats int,
	primary key(tid)
);


create table station(
	stid int,
	stname varchar2(20),
	primary key(stid)
);

create table passenger(
	pid int,
	pname varchar2(20),
	gender varchar2(20),
	age int,
	city varchar2(20),
	primary key(pid)
);

create table troute(
	tid int,
	stid int,
	arrival date,
	departure date,
	foreign key(tid) references train(tid),
	foreign key(stid) references station(stid)
);


create table ticket(
	ticketid int,
	tid int,
	availability varchar2(20),
	class_ varchar2(20),
	source varchar2(20),
	dest varchar2(20),
	fare int,
	departure_time date,
	count_ int,
	primary key(ticketid),
	foreign key(tid) references train(tid)
);


create table booking(
	bid int,
	pid int, 
	ticketid int,
	seat_num int,
	seat_type varchar2(20),
	booking_status varchar2(20),
	location varchar2(20),
	primary key(bid),
	foreign key(pid) references passenger(pid),
	foreign key(ticketid) references ticket(ticketid)
);


--train
insert into train(tid, tname, source, destination, availableseats)
	values(1, 'Subarna Express',  'Chittagong', 'Dhaka', 200)
insert into train(tid, tname, source, destination, availableseats)
	values(1, 'Subarna Express',  'Dhaka','Chittagong',  200)
insert into train(tid, tname, source, destination, availableseats)
	values(2, 'Uddayan Express',  'Sylhet', 'Dhaka', 200)
insert into train(tid, tname, source, destination, availableseats)
	values(2, 'Uddayan Express',  'Dhaka','Sylhet',  200)
insert into train(tid, tname, source, destination, availableseats)
	values(3, 'Drutojan Express',  'Dinajpur', 'Dhaka', 200)
insert into train(tid, tname, source, destination, availableseats)
	values(3, 'Drutojan Express',  'Dhaka','Dinajpur',  200)

--station
insert into station (stid,stname)values(10,'Dhaka Railway Station'); -- delete 'Railway station' if u r using stname as destination and source 
insert into station (stid,stname)values(20,'Chittagong Railway Station'); -- delete 'Railway station' if u r using stname as destination and source 
insert into station (stid,stname)values(30,'Sylhet Railway Station'); -- delete 'Railway station' if u r using stname as destination and source 
insert into station (stid,stname)values(40,'Dinajpur Railway Station'); -- delete 'Railway station' if u r using stname as destination and source 
--passenger
insert into passenger(pid,pname,gender,age,city)values(102,'Abir','Male',19,'Dhaka');
insert into passenger(pid,pname,gender,age,city)values(106,'Mishu','Male',32,'Dhaka');
insert into passenger(pid,pname,gender,age,city)values(103,'Simanta','Female',45,'Chittagong');
insert into passenger(pid,pname,gender,age,city)values(104,'Kanta','Female',29,'Dinajpur');
insert into passenger(pid,pname,gender,age,city)values(105,'Ricky','Male',20,'Sylhet');

--troute
insert into troute(tid,stid,arrival,departure)values(1,10,2019-01-25 08:00:00,2019-01-25 08:30:00); --Dhaka
insert into troute(tid,stid,arrival,departure)values(1,20,2019-01-25 20:00:00,2019-01-25 20:30:00); --Chittagong
insert into troute(tid,stid,arrival,departure)values(2,10,2019-01-25 08:00:00,2019-01-25 08:30:00); --Dhaka
insert into troute(tid,stid,arrival,departure)values(2,30,2019-01-25 20:00:00,2019-01-25 21:00:00);	--Sylhet
insert into troute(tid,stid,arrival,departure)values(3,10,2019-01-25 08:00:00,2019-01-25 08:30:00); --Dhaka
insert into troute(tid,stid,arrival,departure)values(3,40,2019-01-25 20:00:00,2019-01-25 21:30:00); --Dinajpur
--ticket
insert into ticket(ticketid,tid,availability,class_,source,dest,fare,departure_time,count_)
		values(5116,1,'available','1st class','Dhaka','Chittagong',2000,2019-01-25 08:30:00,10);
insert into ticket(ticketid,tid,availability,class_,source,dest,fare,departure_time,count_)
		values(5117,1,'available','AC class','Dhaka','Chittagong',2000,2019-01-25 08:30:00,15);
insert into ticket(ticketid,tid,availability,class_,source,dest,fare,departure_time,count_)
		values(5118,1,'available','1st class','Chittagong','Dhaka',2000,2019-01-25 20:30:00,20);
insert into ticket(ticketid,tid,availability,class_,source,dest,fare,departure_time,count_)
		values(5119,1,'available','AC class','Chittagong','Dhaka',2000,2019-01-25 20:30:00,25);
insert into ticket(ticketid,tid,availability,class_,source,dest,fare,departure_time,count_)
		values(5120,2,'available','1st class','Dhaka','Sylhet',2000,2019-01-25 8:30:00,25);
insert into ticket(ticketid,tid,availability,class_,source,dest,fare,departure_time,count_)
		values(5121,2,'available','AC class','Dhaka','Sylhet', 2000,2019-01-25 8:30:00,25);
insert into ticket(ticketid,tid,availability,class_,source,dest,fare,departure_time,count_)
		values(5122,2,'available','1st class','Sylhet','Dhaka',2000,2019-01-25 21:00:00,25);
insert into ticket(ticketid,tid,availability,class_,source,dest,fare,departure_time,count_)
		values(5123,2,'available','AC class','Sylhet','Dhaka',2000,2019-01-25 21:00:00,25);
insert into ticket(ticketid,tid,availability,class_,source,dest,fare,departure_time,count_)
		values(5125,3,'available','1st class','Dinajpur','Dhaka',2000,2019-01-25 21:30:00,25);
insert into ticket(ticketid,tid,availability,class_,source,dest,fare,departure_time,count_)
		values(5126,3,'available','1st class','Dhaka','Dinajpur',2000,2019-01-25 8:30:00,25);

---booking
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1001,102,,5117,'Snigdha','On','Kamlapur');
insert into ticket(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1002,103,5118,'Shulov','On','Chittagong');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1003,102,5119,'Snigdha','On','Chittagong');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1004,103,5116,'Shulov','On','Kamlapur');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1005,102,5120,'Shulov','On','Kamlapur');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1006,106,5121,'Shulov','On','Kamlapur');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1007,105,5122,'Shulov','On','Sylhet');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1008,106,5123,'Shulov','On','Sylhet');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1009,104,5125,'Shulov','On','Dinajpur');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1010,104,5126,'Shulov','On','Kamlapur');


commit;

select * from train;
select * from station;
select * from passenger;
select * from troute;
select * from ticket;
select * from booking;