data one;
input id aq1 aq2 aq3 bq1 bq2 bq3 cq1 cq2 cq3;
cards;
6091	3	3	.	3	0	2	1	1	1
2159	3	0	0	3	0	1	1	.	.
3573	3	1	0	1	3	2	3	2	3
5060	2	0	2	2	3	2	0	3	2
3850	1	1	1	1	2	3	1	3	2
6845	3	1	3	3	2	.	2	.	1
4660	3	3	1	1	2	3	3	1	3
2311	3	0	.	2	1	0	3	1	3
6142	1	2	1	3	1	1	1	0	2
;

data time1;
  set one;
    time=1;
   array x[3] aq1 aq2 aq3;
    array q[3] q1 q2 q3 (1 2 3);
   do i=1 to 3;
     question=q[i];
     score=x[i];
	   output;
	end;
keep id time question score;
run;



data time2;
set one;
    time=2;
   array x[3] bq1-bq3;
    array q[3] q1 q2 q3 (1 2 3);
   do i=1 to 3;
      question=q[i];
     score=x[i];
	 
	output;
	end;
keep id time question score;
run;

data time3;
set one;
    time=3;
   array x[3] cq1-cq3;
    array q[3] q1 q2 q3 (1 2 3);
   do i=1 to 3;
    question=q[i];
     score=x[i];
	output;
	end;
keep id time question score;
run;

data concatenated;
set time1 time2 time3;
run;

proc sort data=concatenated;
by id time question;
run;


proc print data=concatenated;
run;
