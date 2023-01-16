clear screen;

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