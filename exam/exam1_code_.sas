/* Exercise 1 --

data exercise1;
input ID $ 1-2 Group $ 5-6 Sex $ 7-8 Age 9-11 Race $ 13-14 Visit_1 15-18 Visit_2 20-23 Visit_3 25-28 Visit_4 30-33;
cards;
01	Tx F 62	W 16.5 13.8	17.7 14.6
02	Cx F 53	H 15.8 13.4	16.7 12.8
03	Cx M 44	H 13.0 13.1	9.5	 11.6
04	Cx F 20	H 13.0 13.1	9.5	 11.6
05	Tx M 57	B 16.5 13.0	10.5 13.5
06	Tx M 41	W 19.0 .	13.2 15.7
07	Tx F 25	B 15.0 14.9	13.1 12.7
08	Cx F 75	B 16.0 13.0	12.9 12.5
09	Cx F 30	B 12.0 12.4	.	 13.5
10	Cx M 42	W 10.0 12.4	11.9 13.8
11	Cx M 42	W 17.5 20.0	14.9 16.0
12	Tx M 42	W 16.3 14.3	14.4 12.2
13	Tx M 52	H 26.0 .	.	 .
14	Cx M 52	B 23.5 18.3	17.1 17.2
15	Tx F 29	W 15.5 16.1	15.5 15.5
16	Tx M 33	W 14.0 15.5	13.1 13.3
17	Tx F 54	B 23.5 19.6	22.5 17.4
18	Cx F 68	H 20.0 19.4	18.5 16.9
19	Tx M 43	W 15.0 .	15.4 14.8
20	Cx F 50	W 15.0 17.0	.	 16.6
;

proc means data = exercise1 n mean median std min max range maxdec = 2;
	class Group;
	label Age = 'Age';
	label Visit_1 = 'Visit 1';
	label Visit_2 = 'Visit 2';
	label Visit_3 = 'Visit 3';
	label Visit_4 = 'Visit 4';
	title "Erick's Exercise 1 Output :)";
run;
	
*/

/* Exercise 2 --

PROC IMPORT OUT= WORK.exercise2 
            DATAFILE= "C:\Users\casti\OneDrive\Desktop\ExamEx2_1.txt" ; 
     GETNAMES=YES;
RUN;

proc freq data = work.exercise2;
	tables A*B/ nocum nopercent norow nocol;
	title "Erick's AxB Table";
run;

*/

/* Exercise 3 -- Part A

data int;
input ID$ GROUP$ BMI_base BMI_3mos BMI_9mos;
cards;
101	int	34.5 33.8 31.1
102	int	30.7 29.6 27.3
103	int	32.0 30.7 27.5
105	int	34.6 33.5 33.3
106	int	37.6 34.9 30.1
107	int	30.2 29.2 28.7
108	int	37.2 36.0 35.1
109	int	35.2 33.3 33.7
111	int	32.3 31.4 29.4
;

data cnt;
input ID$ GROUP$ BMI_base BMI_3mos BMI_9mos;
cards;
401	cnt	33.7 33.4 33.2
402	cnt	31.2 30.1 29.8
404	cnt	30.8 31.1 31.8
406	cnt	29.2 29.0 28.9
408	cnt	27.7 27.3 27.9
409	cnt	33.8 32.9 31.4
;

data exercise3;
set int cnt;
BMI_change = BMI_9mos - BMI_base;
run;

proc print data = exercise3 noobs;
title "Exercise 3 -- Erick's Solution";
run;
*/

/* Exercise 3 -- Part B



data exercise4;
set int cnt;
BMI_change = BMI_9mos - BMI_base;
if (GROUP = 'int' & BMI_change > -3) | (GROUP ='cnt' & BMI_change > 0) then delete;
drop BMI_change;
run;


proc print data = exercise4 noobs;
title "Exercise 3 -- Erick's Solution";
run;
*/

/*Exercise 4 */
data exercise4;
input id $ knee_num score0 score1 score2 score3;
cards;
 01 1 0 5 7 10
 02 1 0 10 15 15
 02 2 3 5 8 10
 03 1 0 3 3 3
 03 2 0 6 9 9
 04 1 0 4 10 10
run;

data parta1;
 set exercise4;
	array knees[*] knee_num;
		do i=1 to 1;
			num = knees[i];
				do j = 1 to 4;
				 knee = num;
				 	output;
				end;
		end;
	keep knee;
run;

data parta2;
	set exercise4;
 	array allscores[4] score0-score3;
		do i=1 to 4;
			scores=allscores[i];
				output;
		end;
	keep scores;
run;

data parta3;
	set exercise4;
	array id_num[*] id;
		do i=1 to 1;
			ids = id_num[i];
				do j=1 to 4;
					patient_id = ids;
						output;
				end;
		end;
	keep patient_id;
run;

data complete_set;
 merge parta3 parta1 parta2;
run;

data parta;
 set complete_set;
 	if knee = 2 then delete;
run;

data partb;
 set complete_set;
 	if knee = 1 then delete;
run;

data ops;
input visit $ 1-7;
cards;
pre-op
day 1
week 1
month 1
pre-op
day 1
week 1
month 1
pre-op
day 1
week 1
month 1
pre-op
day 1
week 1
month 1
;
run;

data partc1;
	merge ops parta; 
run;

data partc2;
	drop knee;
	merge partc1 (rename =(scores = score_knee1))
		  partb (rename =(scores = score_knee2));
				by patient_id;
run;

data partc3;
	retain patient_id visit score_knee1 score_knee2;
	set partc2;
run;


proc print data = partc3 noobs;
title "Erick's Part C";
run;
 
