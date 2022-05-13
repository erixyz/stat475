/* Exercise 1 -- Programming section. */


/* This is the first method to import data. This is known as instream reading */

data method1;
input Team $ 1-12 Attendance 17-21 Price 25-30;
cards;
Atlanta			13993	20.06
Boston			14916	22.54
Charlotte		23901	17
Chicago			18404	21.98
Cleveland		16969	19.63
Dallas			16868	17.05
Denver			12668	17.4
Detroit			21454	24.42
Golden State	15025	17.04
Houston	        15846	17.56
Indiana	    	12885	13.77
LA Clippers		11869	21.95
LA Lakers		17378	29.18
Miami	    	15008	17.6
Milwaukee		16088	14.08
Minnesota		26160	10.92
New Jersey		12160	13.31
New York		17815	22.7
Orlando			15606	20.47
Philadelphia	14017	19.04
Phoenix			14114	16.59
Portland		12884	22.19
Sacramento		17014	16.96
San Antonio		14722	16.79
Seattle			12244	18.11
Utah			12616	18.41
Washington		11565	14.55
;
proc print data = method1;
run;


/* This is the second method -- referencing data stored in computer. */

data method2;
infile 'C:/Users/casti/OneDrive/Desktop/School_Stuff/Masters_Stuff/STAT475/homework1/NBA.txt';
input Team $ Attendance $ Price $;
run;

proc print data = method2;
run;


/* Third method -- importing an .xls file. */

proc import out = method3
datafile = "C:/Users/casti/OneDrive/Desktop/School_Stuff/Masters_Stuff/STAT475/homework1/NBA.xls"
dbms = xls replace;

proc print data = method3;
run;


/* Exercise 2 -- Enter table using the DO statement */

data method4;
length group $15;
do counter= 1 to 93; 
    response = 'yes';
      group = 'surgical';
    output;
  end;


do counter= 1 to 1034; 
    response = 'no';
      group = 'surgical';
    output;
  end;

do counter= 1 to 21; 
    response = 'yes';
      group = 'nonsurgical';
    output;
  end;

do counter= 1 to 768; 
    response = 'no';
      group = 'nonsurgical';
    output;
  end;

run;

proc print data = method4;
run;

