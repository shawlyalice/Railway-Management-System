clear screen;
set lines 350;
set trimout on;
set tab off;


select * from train@site_link;
select * from station@site_link;
select * from passenger@site_link;
select tid, stid, to_char(arrival, 'HH24:MI:SS') arrival, to_char(departure, 'HH24:MI:SS') departure from troute@site_link;
select ticketid,tid,status_,class_,source,dest,fare, to_char(departure_time, 'HH24:MI:SS') departure_time,count_ from ticket@site_link;