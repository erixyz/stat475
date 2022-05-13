/* Final -- Problem 2 */

%let fname = Erick;
%let lname = Castillo;

/* 1. */

PROC SORT data = tmp1.surveyresults;
	by schoolname;
RUN;

PROC SORT data = tmp1.api;
	by schoolname;
RUN;

DATA work.combo;
	merge tmp1.surveyresults tmp1.api;
		by schoolname;
	if q2 = '' then delete;
	new_q2 = input(q2, 2.);
	drop q2;
	rename new_q2 = q2;
RUN;

/*
PROC PRINT data = work.combo;
RUN;	
*/

/* 2. */

/*
PROC STDIZE data=work.combo out=work.combo1 method=mean reponly;
var q2;
RUN;
*/

PROC MEANS data = work.combo noprint;
	var q2;
output out=outmean mean = q2_mean;
RUN;

DATA _null_;
	set outmean;
	call symput('q2_mean', round(q2_mean, 0.01));
RUN;

%put &q2_mean;

DATA work.combo1;
	set work.combo;
	if q2 = . then q2 = &q2_mean;
RUN;

/*
PROC PRINT data = combo1;
RUN;
*/

/* 3. */


DATA combo2;
	set work.combo1;
	req4 = 4-q4;
	req7 = 4-q7;
	drop q4 q7;

	total = sum(q1,q2,req4,q5,q6,req7,mean(q3a,q3b,q3c,q3d,q3e,q3f,q3g,q3h), mean(q8a,q8b,q8c,q8d,q8e));
RUN;

/*
PROC PRINT data = combo2;
RUN;
*/

/* 4. */


PROC GPLOT data =  work.combo2;
	plot total*api;
RUN;


/* 5. */


PROC SORT data = combo2;
	by descending api;
RUN;

DATA final;
	set combo2 (obs = 10);
	keep schoolname api total;
RUN;

PROC PRINT data = final;
	format total 6.3;
RUN;

title "Completed by &fname &lname on &sysdate at &systime";

