data one;
input id$ aq1 aq2 aq3 bq1 bq2 bq3 cq1 cq2 cq3;
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

data longform;
 set one;
   array x[3,3] _numeric_;
   do time=1 to 3;
        do question=1 to 3;
           score=x[time, question];
	       output;
	    end;
   end; 
keep id time question score;
run;

 proc print data=longform;
 run;

