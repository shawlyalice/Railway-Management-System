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
insert into passenger(pid,pname,gender,age,city) values(104,'Kanta','Female',29,'Dinajpur');
insert into passenger(pid,pname,gender,age,city) values(105,'Ricky','Male',20,'Sylhet');
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
		
-- Ticket bookings made at Dhaka
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1001,102,5117,1,'Snigdha','Booked','Dhaka');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1002,103,5118,2,'Shulov','Booked','Dhaka');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1003,102,5119,3,'Snigdha','Booked','Dhaka');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1004,103,5116,4,'Shulov','Booked','Dhaka');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1005,102,5120,5,'Shulov','Booked','Dhaka');
insert into booking(bid,pid,ticketid,seat_num,seat_type,booking_status,location)
		values(1006,106,5121,6,'Shulov','Booked','Dhaka');
		
commit;
