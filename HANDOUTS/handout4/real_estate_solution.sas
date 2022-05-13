data price;
input @1 Age 2.0 @4 SQFT comma5. @10 Bedrms 1. @12 Remodeled $char3.
@16 Discount percent3. @20 Price comma10.;
cards;
45 1,700 3 yes 10% $560,000
10 2,700 3  no 15% $670,500
12 3,450 5  no 25% $1,100,000
34 1,080 2 yes 15% $307,000
25   750 1  no 10% $195,000
;

proc print;
format Discount percent5. Price dollar10.;
run;

