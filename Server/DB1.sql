clear screen;
set lines 350;
set trimout on;
set tab off;

drop table train cascade constraints;
drop table station cascade constraints;
drop table passenger cascade constraints;
drop table troute cascade constraints;
drop table ticket cascade constraints;
drop table booking cascade constraints;

create table train(
	tid int,
	tname varchar2(50),
	source varchar2(50),
	destination varchar2(50),
	seats int,
	primary key(tid)
);


create table station(
	stid int,
	stname varchar2(50),
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
	status_ varchar2(50),
	class_ varchar2(50),
	source varchar2(50),
	dest varchar2(50),
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
	seat_type varchar2(50),
	booking_status varchar2(50),
	location varchar2(50),
	primary key(bid),
	foreign key(pid) references passenger(pid),
	foreign key(ticketid) references ticket(ticketid)
);


--train
insert into train(tid, tname, source, destination, seats)
	values(1, 'Subarna Express',  'Chittagong', 'Dhaka', 200);
insert into train(tid, tname, source, destination, seats)
	values(2, 'Uddayan Express',  'Sylhet', 'Dhaka', 200);
insert into train(tid, tname, source, destination, seats)
	values(3, 'Drutojan Express',  'Dinajpur', 'Dhaka', 200);
insert into train(tid, tname, source, destination, seats)
	values(4, 'Mohanagar Provati',  'Dhaka', 'Chittagong',  200);
insert into train(tid, tname, source, destination, seats)
	values(5, 'Joyantika Express',  'Dhaka','Sylhet',  200);
insert into train(tid, tname, source, destination, seats)
	values(6, 'Ekota Express',  'Dhaka','Dinajpur',  200);

--station
insert into station (stid,stname) values(1,'Dhaka Railway Station');
insert into station (stid,stname) values(2,'Chittagong Railway Station');
insert into station (stid,stname) values(3,'Sylhet Railway Station');
insert into station (stid,stname) values(4,'Dinajpur Railway Station');

--passenger
insert into passenger(pid,pname,gender,age,city) values(102,'Abir','Male',19,'Dhaka');
insert into passenger(pid,pname,gender,age,city) values(106,'Mishu','Male',32,'Dhaka');
insert into passenger(pid,pname,gender,age,city) values(103,'Simanta','Female',45,'Chittagong');
insert into passenger(pid,pname,gender,age,city) values(104,'Shawly','Female',29,'Dinajpur');
insert into passenger(pid,pname,gender,age,city) values(105,'Ricky','Male',20,'Sylhet');


--troute
insert into troute(tid,stid,arrival,departure) values(1,1,TO_DATE('2019/09/28 08:00:00', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2019/09/28 08:30:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into troute(tid,stid,arrival,departure) values(1,2,TO_DATE('2019/09/28 20:00:00', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2019/09/28 20:30:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into troute(tid,stid,arrival,departure) values(2,1,TO_DATE('2019/09/28 08:00:00', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2019/09/28 08:30:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into troute(tid,stid,arrival,departure) values(2,3,TO_DATE('2019/09/28 20:00:00', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2019/09/28 21:00:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into troute(tid,stid,arrival,departure) values(3,1,TO_DATE('2019/09/28 08:00:00', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2019/09/28 08:30:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into troute(tid,stid,arrival,departure) values(3,4,TO_DATE('2019/09/28 20:00:00', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2019/09/28 21:30:00', 'yyyy/mm/dd hh24:mi:ss'));

--ticket
insert into ticket(ticketid,tid,status_,class_,source,dest,fare,departure_time,count_)
		values(5116,1,'available','1st class','Dhaka','Chittagong',2000, TO_DATE('2019/09/28 08:30:00', 'yyyy/mm/dd hh24:mi:ss'), 10);
insert into ticket(ticketid,tid,status_,class_,source,dest,fare,departure_time,count_)
		values(5117,1,'available','AC class','Dhaka','Chittagong',2000, TO_DATE('2019/09/28 08:30:00', 'yyyy/mm/dd hh24:mi:ss'), 15);
insert into ticket(ticketid,tid,status_,class_,source,dest,fare,departure_time,count_)
		values(5118,1,'available','1st class','Chittagong','Dhaka',2000, TO_DATE('2019/09/28 20:30:00', 'yyyy/mm/dd hh24:mi:ss'), 20);
insert into ticket(ticketid,tid,status_,class_,source,dest,fare,departure_time,count_)
		values(5119,1,'available','AC class','Chittagong','Dhaka',2000, TO_DATE('2019/09/28 20:30:00', 'yyyy/mm/dd hh24:mi:ss'), 25);
insert into ticket(ticketid,tid,status_,class_,source,dest,fare,departure_time,count_)
		values(5120,2,'available','1st class','Dhaka','Sylhet',2000, TO_DATE('2019/09/28 08:30:00', 'yyyy/mm/dd hh24:mi:ss'), 25);
insert into ticket(ticketid,tid,status_,class_,source,dest,fare,departure_time,count_)
		values(5121,2,'available','AC class','Dhaka','Sylhet', 2000, TO_DATE('2019/09/28 08:30:00', 'yyyy/mm/dd hh24:mi:ss'), 15);
insert into ticket(ticketid,tid,status_,class_,source,dest,fare,departure_time,count_)
		values(5122,2,'available','1st class','Sylhet','Dhaka',2000, TO_DATE('2019/09/28 21:00:00', 'yyyy/mm/dd hh24:mi:ss'), 15);
insert into ticket(ticketid,tid,status_,class_,source,dest,fare,departure_time,count_)
		values(5123,2,'available','AC class','Sylhet','Dhaka',2000, TO_DATE('2019/09/28 21:30:00', 'yyyy/mm/dd hh24:mi:ss'), 25);
insert into ticket(ticketid,tid,status_,class_,source,dest,fare,departure_time,count_)
		values(5125,3,'available','1st class','Dinajpur','Dhaka',2000, TO_DATE('2019/09/28 21:30:00', 'yyyy/mm/dd hh24:mi:ss'), 25);
insert into ticket(ticketid,tid,status_,class_,source,dest,fare,departure_time,count_)
		values(5126,3,'available','1st class','Dhaka','Dinajpur',2000, TO_DATE('2019/09/28 08:30:00', 'yyyy/mm/dd hh24:mi:ss'), 25);

---booking
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1001,102,5117,1,'Snigdha','Booked','Kamlapur');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1002,103,5118,2,'Shulov','Booked','Chittagong');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1003,102,5119,3,'Snigdha','Booked','Chittagong');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1004,103,5116,4,'Shulov','Booked','Kamlapur');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1005,102,5120,5,'Shulov','Booked','Kamlapur');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1006,106,5121,6,'Shulov','Booked','Kamlapur');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1007,105,5122,7,'Shulov','Booked','Sylhet');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1008,106,5123,8,'Shulov','Booked','Sylhet');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1009,104,5125,9,'Shulov','Booked','Dinajpur');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1010,104,5126,10,'Shulov','Booked','Kamlapur');


commit;

select * from train;
select * from station;
select * from passenger;
select tid, stid, to_char(arrival, 'HH24:MI:SS') arrival, to_char(departure, 'HH24:MI:SS') departure from troute;
select ticketid,tid,status_,class_,source,dest,fare, to_char(departure_time, 'HH24:MI:SS') departure_time,count_ from ticket;
select * from booking;



/* StationId instead of location in booking table*/
/* Train goes from a-z or a-b-c-d-z */
/* If train goest from a to z. Troute table not needed*/
