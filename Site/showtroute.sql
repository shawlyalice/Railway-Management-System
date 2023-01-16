set lines 350;
set trimout on;
set tab off;

select 
	tid, stid, to_char(arrival, 'HH24:MI:SS') arrival, 
	to_char(departure, 'HH24:MI:SS') departure 
from troute;