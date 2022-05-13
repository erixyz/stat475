/* Final -- Problem 1 */
%let fname = Erick;
%let lname = Castillo;

/* 1. */

/*
PROC SQL;
select count(*) as total_rows
from tmp1.snowstationsdata;
QUIT;
*/

/* 2. */

/*
PROC CONTENTS data = tmp1.snowstationsdata;
RUN;
*/

/* 3. */

/*
PROC SQL;
select count(distinct stationname) as unique_stations
from tmp1.snowstationsdata;
QUIT;
*/

/* 4. */

/*
PROC SQL;
select stationname, count(distinct year) as years_recorded
from tmp1.snowstationsdata
group by stationname;
QUIT;
*/

/* 5. */

/*
PROC SQL;
select year, count(distinct stationname) as num_stations
from tmp1.snowstationsdata
group by year;
QUIT;
*/

/* 6. */

/*
PROC SQL;
select stationname, max(maxsweinches) as maxmax_SWE
from tmp1.snowstationsdata
group by stationname;
QUIT;
*/

/* 7. */

/*
data tmp1.snowstationsdata;
	modify tmp1.snowstationsdata;
		if stationname = 'ADIN MOUTAIN' 
		then stationname = 'ADIN MOUNTAIN';
run;

* proof of fix;
PROC SQL;
select *
from tmp1.snowstationsdata
where stationname like 'ADIN MOUNTAIN'
group by stationname;
QUIT;
*/

/* 8. */

/*
PROC SQL;
select count(distinct region) as diffRegions
from tmp1.snowstationsdata;
QUIT;
*/

/* 9. */

/*
PROC SQL;
select region, count(distinct stationname) as total_stations
from tmp1.snowstationsdata
group by region;
QUIT;
*/

/* 10. */


PROC SQL;
select distinct(stationid) as stationid, stationname, region,
	   max(maxsweinches) as total_max_swe, elevationinfeet, 
	   latitude, longitude
from tmp1.snowstationsdata
where yearrecordbegan <= 1963 and year >= 1963
group by stationid;	
QUIT;

title "Completed by &fname &lname on &sysdate at &systime";
