data grades484;
input id $ grade_484 $;
cards;
8266	A
7756	A
8993	A
7343	A
9622	A
6718	A
3406	A
6509	A
1609	A
9393	A
5259	A
6056	A
8407	A
6346	A
1059	A
2267	A
6219	A
384		A
278		A
7354	B
8441	B
6306	A
495		B
8991	B
2272	B
3598	B
9038	B
8219	B
5310	C
;

data grades550;
input id $ grade_550 $;
cards;
7098	A
3528	A
6718	A
7006	A
2272	A
4852	A
6056	A
8266	A
1358	A
7577	A
114		A
1455	A
477		A
7436	A
7756	A
5843	A
3406	A
1841	A
6666	A
1401	A
4219	A
9640	A
33		A
384		A
8178	A
6346	A
8819	A
9900	A
5967	A
3236	A
6119	A
2721	A
3572	A
5310	B
3522	B
8219	B
8991	B
9163	B
1548	B
3598	B
495		B
;

data grades695;
input id $ grade_695 $;
cards;
2267	A
3528	A
3239	A
477		A
7317	A
7352	A
9236	A
7696	A
5967	A
5372	A
5298	A
9406	A
7756	A
8407	A
2431	A
741		A
4852	A
1841	A
3406	A
6306	A
7577	A
2835	A
8025	A
1455	A
7648	B
3572	B
1401	B
5310	B
203		B
;

/* Exercise 1 -- Part A */

/*
PROC SQL;
select *
from work.grades550, work.grades484
where grades550.id = grades484.id
group by grades550.id;
QUIT;
*/

/* Exercise 1 -- Part B */

/*
PROC SQL;
select *
from work.grades550, work.grades695
where grades550.id = grades695.id
group by grades550.id;
QUIT;
*/

/* Exercise 1 -- Part C */

/*
PROC SQL;
select *
from work.grades484, work.grades695
where grades484.id = grades695.id
group by grades484.id;
QUIT;
*/

/* Exercise 1 -- Part D */

/*
PROC SQL;
select *
from work.grades484, work.grades695, work.grades550
where grades484.id = grades695.id = grades550.id
group by grades484.id;
QUIT;
*/



/* Exercise 2 -- Part A */
data glaucoma;
input id $ group $ nmeds time gender $ age type$;
cards;
95	Tx	2	8	M	60	normotensive
95	Cx	2	8	M	60	normotensive
108	Tx	2	8	F	84	POAG
108	Cx	2	8	F	84	POAG
116	Tx	2	17	M	61	normotensive
116	Cx	2	17	M	61	normotensive
117	Tx	2	6	M	84	normotensive
117	Cx	2	6	M	84	normotensive
130	Tx	2	1	F	61	normotensive
130	Cx	2	1	F	61	normotensive
71	Tx	1	12	F	92	POAG
71	Cx	1	12	F	92	POAG
83	Tx	1	15	M	87	normotensive
83	Cx	1	15	M	87	normotensive
92	Tx	1	4	F	55	normotensive
92	Cx	1	4	F	55	normotensive
98	Tx	1	26	M	72	traumatic
98	Cx	1	26	M	72	traumatic
102	Tx	1	15	F	82	POAG
102	Cx	1	15	F	82	POAG
103	Tx	1	1	M	59	normotensive
103	Cx	1	1	M	59	normotensive
109	Tx	1	5	M	73	POAG
109	Cx	1	5	M	73	POAG
112	Tx	1	9	F	51	normotensive
112	Cx	1	9	F	51	normotensive
113	Tx	1	28	M	74	pigmentary
113	Cx	1	28	M	74	pigmentary
114	Tx	1	14	F	91	POAG
114	Cx	1	14	F	91	POAG
115	Tx	1	19	M	79	pigmentary
115	Cx	1	19	M	79	pigmentary
120	Tx	1	13	M	65	POAG
120	Cx	1	13	M	65	POAG
82	Tx	0	0	M	74	normotensive
82	Cx	0	0	M	74	normotensive
110	Tx	0	9	M	67	normotensive
110	Cx	0	9	M	67	normotensive
118	Tx	0	7	M	79	POAG
118	Cx	0	7	M	79	POAG
121	Tx	0	0	M	75	normotensive
121	Cx	0	0	M	75	normotensive
125	Tx	0	1	M	89	POAG
125	Cx	0	1	M	89	POAG
126	Tx	0	0	F	67	normotensive
126	Cx	0	0	F	67	normotensive
128	Tx	0	0	M	62	pigmentary
128	Cx	0	0	M	62	pigmentary
129	Tx	0	0	M	66	POAG
129	Cx	0	0	M	66	POAG
132	Tx	0	0	M	63	POAG
132	Cx	0	0	M	63	POAG
;

/* Exercise 2 -- Part A */

/*
PROC SQL;
select count(distinct ID) as total_patients
from work.glaucoma;
QUIT;
*/

/* Exercise 2 -- Part B */

/*
PROC SQL;
select count(distinct id) as patients_without_meds
from glaucoma
where nmeds = 0;
QUIT;
*/

/* Exercise 3 -- Part C */

/*
PROC SQL;
select count(distinct id) as patients_on_meds,
	   mean(time) as avg_time,
	   std(time) as std_time,
	   min(time) as min_time,
	   max(time) as max_time
from glaucoma
where nmeds > 0;
QUIT;
*/

/* Exercise 3 -- Part D */

/*
PROC SQL;
select gender, count(distinct id) as patients
from glaucoma
group by gender;
QUIT;
*/

/* Exercise 3 -- Part E */

/*
PROC SQL;
select type, count(distinct id) as Patients
from glaucoma
group by type;
QUIT;
*/

/* Exercise 3 -- Part F */

/*
PROC SQL;
select gender, type, mean(age) as avg_age
from glaucoma
group by gender, type;
QUIT;
*/

/* Exercise 4 */
/*
data dummy;
input num;
cards;
1
;

proc print data = dummy;
run;

%macro prob4;
%let a=1;
%let sum=%eval(&a+&a);
%put &sum;
%let name=Erick Castillo;
%let first=%scan(&name,1);
%let last=%scan(&name,2);
%put &first;
%put &last;
title "Assignment completed by &first &last on &sysdate at &systime where &a + &a = &sum";
%mend;

%prob4
*/

/* Exercise 5 -- PROC TABULATE*/
/*
data tab;
input gender $ pets $ 6-14 num_pets;
cards;
boy  cockatiel 1
boy  turtle    3
boy  rabbit    4
girl cockatiel 2
girl turtle    3
girl rabbit    7
;

proc format;
value $petsfmt
'cockatiel'= 'C:/Users/casti/OneDrive/Desktop/School_Stuff/Masters_Stuff/STAT475/homework4/cockatiel.jpg'
'rabbit' = 'C:/Users/casti/OneDrive/Desktop/School_Stuff/Masters_Stuff/STAT475/homework4/rabbit.jpg'
'turtle' = 'C:/Users/casti/OneDrive/Desktop/School_Stuff/Masters_Stuff/STAT475/homework4/turtle.jpg';
run;

proc tabulate data = tab;
class gender pets;
classlev gender/s=[foreground=white background=purple just=r];
classlev pets/s=[foreground=white background=green just=l
postimage = $petsfmt.];
var num_pets;
table gender={s=[foreground=white background=blue just=c]},
pets={s=[foreground=white background=pink just=c]}
*num_pets=''*sum=''/box='# of Pets';
title 'Number of Cute Pets Owned by Families of 3rd Graders';
run;
*/

/* Bernoulli Problem */
/*
%macro bern(n,p);

data bernie;
do i=1 to &n;
	sum + rand("Bernoulli", &p);
	exp = sum/i;
output;
end;
keep exp i;
run;

proc gplot data = bernie;
plot exp*i/vref=&p;
run;
%mend;

%bern(3000, 0.420)
title "Law of Large Numbers Using Bernoulli RV";
*/

/* Exercise 6 */
data lastprob;
input prodnum $ prodname $ 6-27 manunum $ 29-31 prodtype $ 33-43 rtlcost;
cards;
5009 Dream Machine	        500	Workstation 3200 
4506 Business Machine     	450	Workstation	3345 
2101 Travel Laptop	        400 Laptop		2760 
2212 Analog Cell Phone	    230	Phone	    35 
4509 Digital Cell Phone		245	Phone	    175 
5003 Office Phone	        560	Phone	    145 
1110 Spreadsheet Software	134 Software	300 
1200 Database Software		113 Software	799 
3409 Statistical Software	243	Software	1899 
2102 Wordprocessor Software 245 Software	345 
2200 Graphics Software		246	Software	599 
;
run;

PROC SQL;
insert into work.lastprob
set prodnum = '3480',
	prodname = 'Desktop Computer',
	manunum = '780',
	prodtype = 'Workstation',
	rtlcost = 1799;
QUIT;

PROC SQL;
update work.lastprob
set rtlcost =
	case when prodtype = 'Software' then rtlcost*1.20
	else rtlcost*0.80
	end;
QUIT;

PROC SQL;
alter table work.lastprob
	modify rtlcost format = dollar8.2 label='Retail Unit Cost'
	modify prodnum label = 'Product Number'
	modify prodname label = 'Product Name'
	modify manunum label = 'Manufacturer Number'
	modify prodtype label = 'Product Type';

select *
	from work.lastprob;
QUIT;

title "Product Information";
footnote "Updated on &sysdate";
