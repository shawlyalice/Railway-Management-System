set lines 350;
set trimout on;
set tab off;

select 
	ticketid,tid,status_,class_,source,dest,fare, 
	to_char(departure_time, 'HH24:MI:SS') departure_time,count_ 
from ticket;