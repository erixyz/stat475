/* HW3 -- Exercise 1 */

/*
data docvisits;
 input patientID$ weekday$ score;
 cards;
 101 Monday 10
 101 Friday 15
 112 Tuesday 11
 123 Monday 9
 123 Tuesday 10 
 123 Friday 9
 104 Friday 23
 104 Saturday 20
 157 Tuesday 10
 157 Thursday 18
 157 Saturday 21
;
*/

/* a) compute number of patients */

/*
PROC SQL;
SELECT count(distinct patientID) as total_patients
FROM WORK.docvisits;
QUIT;
*/

/* b) List patient IDs and the total number of visits for each patient */

/*
PROC SQL;
SELECT patientID, count(weekday) as total_visits
FROM WORK.docvisits
GROUP BY patientID; 
QUIT;
*/

/* c) List the days of the week that visits were on and the total 
number of patients who visited each day. */

/*
PROC SQL;
SELECT weekday, count(patientID) as number_patients
FROM WORK.docvisits
GROUP BY weekday;
QUIT;
*/

/*HW3 -- Exercise 2 */
data record;
input ID$ Gender$ Age Score;
cards;
259632 F 56 58
259632 F 56 41
259632 F 56 39
577763 F 67 40
577763 F 67 50
577763 F 67 39
577763 F 67 33
279645 M 52 24
279645 M 52 65
279645 M 52 66
279645 M 52 74
279645 M 52 85
694797 F 48 37
694797 F 48 85
684516 M 57 81
760076 M 62 45
760076 M 62 35
760076 M 62 38
760076 M 62 65
745795 F 74 85
745795 F 74 82
745795 F 74 77
745795 F 74 81
506301 M 78 70
506301 M 78 70
506301 M 78 71
506301 M 78 67
406126 M 62 60
406126 M 62 50
477908 M 70 50
477908 M 70 63
477908 M 70 51
; 

/* a) How many patients are in the dataset? */

/*
PROC SQL;
select count(distinct ID) as totalPatients
from record;
QUIT;
*/

/* b) How many patients are there by gender? */
/*
PROC SQL;
select Gender,
	   count(distinct ID) as totalPatients
from record
group by Gender;
QUIT;
*/

/* c) How many patients are older than 65 years old? */
/*
PROC SQL;
select count(distinct ID) as patientsOver65
from record
where Age > 65;
QUIT;
*/

/* d) How many women are older than 65 years old? */
/*
PROC SQL;
select count(distinct ID) as womenOver65
from record
where Age > 65 and Gender = 'F';
QUIT;
*/

/* e) How many visits per patient? */
/*
PROC SQL;
select ID, count(ID) as totalVisits
from record
group by ID;
QUIT;
*/

/* f) How many visits for each patient with a medical score above 50? */
/*
PROC SQL;
select ID, count(ID) as totalVisits
from record
where Score > 50
group by ID
order by totalVisits, ID;
QUIT;
*/

/* g) What are minimum, mean, and maximum scores for each patient? */
/*
PROC SQL;
select ID, 
	min(Score) as minScore, 
	mean(Score) as avgScore, 
	max(Score) as maxScore
from record
group by ID;
QUIT;
*/

/* h) List patients who have a mean score larger than 45 for all their visits. */

PROC SQL;
select ID,
	mean(Score) as avgScore
from record
group by ID
having mean(Score) > 45;
QUIT;
