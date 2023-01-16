clear screen;
set lines 350;
set trimout on;
set tab off;

select * from train;
select * from station;
select * from passenger;
select tid, stid, to_char(arrival, 'HH24:MI:SS') arrival, to_char(departure, 'HH24:MI:SS') departure from troute;
select ticketid,tid,status_,class_,source,dest,fare, to_char(departure_time, 'HH24:MI:SS') departure_time,count_ from ticket;
select * from booking;