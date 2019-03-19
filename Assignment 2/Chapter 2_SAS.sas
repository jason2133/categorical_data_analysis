/* MI data */
data MI;
input aspirin MI count @@;
datalines;
1 1 189 1 2 10845
2 1 104 2 2 10933
;

proc freq order=data data=MI; 
   weight count;
   tables aspirin*MI/ chisq expected  measures;
run;


/* political gender gap data */
data GenderGap2;
input gender $ party $ count @@;
datalines;
F D 762 F R 327 F I 468
M D 484 M R 239 M I 477
;

proc freq order=data data=GenderGap2; 
   weight count;
   tables gender*party/ chisq expected;
run;



/* tea data */
data tea;
input x  y  count @@;
datalines;
1 1 3 1 2 1 
2 1 1 2 2 3 
;

proc freq order=data data=tea; 
   weight count;
   tables x*y/ chisq expected;
run;



/* Malform data */
data malform;
input alcohol malformation  count @@;
datalines;
0 0 17066 0 1 48
0.5 0 14464 0.5 1 38
1.5 0  788 1.5 1 5
4.0 0 126 4.0 1 1
7.0 0  37 7.0 1 1
;

proc freq order=data data=malform; 
   weight count;
   tables alcohol*malformation/ chisq cmh trend; 
run;


