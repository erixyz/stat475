data one;
input id	a	b	c	d	e	f	g;
cards;
45	4	1	0	2	2	4	3
86	2	4	2	1	0	8	2
62	4	1	4	1	2	3	1
71	4	1	0	9	2	4	3
25	4	0	3	4	0	0	4
88	3	2	1	4	1	9	1
39	2	3	3	0	2	3	0
87	8	3	1	0	1	3	0
15	3	0	2	0	3	4	9
23	4	0	0	0	2	4	2
77	3	4	8	2	2	0	1
95	3	2	2	2	9	2	9
35	2	0	2	4	0	0	3
29	4	3	0	2	1	1	1
run;

data two (drop=i);
set one;
  array x[*] a b c d e f g;
    array y[*] a1 b1 c1 d1 e1 f1 g1;
  do i=1 to dim(x);
    if (x[i]=8 or x[i]=9) then y[i]=.;
	 else y[i]=4-x[i];
  end;
run;

proc print data=two;
run;
