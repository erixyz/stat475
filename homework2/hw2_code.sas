/* First coding exercise of HW 2 */
/*
PROC IMPORT OUT= WORK.exercise1 
            DATAFILE= "C:\Users\casti\OneDrive\Desktop\School_Stuff\Mast
ers_Stuff\STAT475\homework2\Asthma_Ex1.xls" 
            DBMS=EXCEL REPLACE;
     RANGE="Sheet1$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;

PROC SORT data = WORK.exercise1;
BY Smoking Patient;

ods html path = 'C:\Users\casti\OneDrive\Desktop' file = 'exout1.html';

title1 'Asthma Patients';
title2 'Basic Data';
footnote1 'Data from Medical Records';

options nonumber nodate;

PROC PRINT data = work.exercise1 noobs;
	VAR Patient Asthma Age BMI;
	FORMAT BMI COMMA5.2;
	BY Smoking;
run;

ods html close;

 

/* Second exercise -- HW 2 */

/* erase this line to execute chunk below

PROC IMPORT OUT= WORK.EXERCISE2 
            DATAFILE= "C:\Users\casti\OneDrive\Desktop\School_Stuff\Mast
ers_Stuff\STAT475\homework2\Exam_Ex2.xls" 
            DBMS=EXCEL REPLACE;
     RANGE="Sheet1$"; 
     GETNAMES=NO;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;

DATA WORK.EXERCISE2;
	SET WORK.EXERCISE2;
	IF F3 = 'Postal Abbrev.' THEN DELETE;
RUN;

title;

PROC REPORT data = work.exercise2 wd headline headskip;
	COLUMN F1 F2 F3 F4 F5;
	DEFINE F1/width=15 'State Name' left;
	DEFINE F2/width=15 'State/ Abbrev.' left;
	DEFINE F3/width=8 'Postal/ Abbrev.' left;
	DEFINE F4/width=15 format=comma7. 'Area/ (Sq Mi)' right;
	DEFINE F5/width=15 format=comma10. 'Population' right;
RUN;

erase this line to execute chunk above */



