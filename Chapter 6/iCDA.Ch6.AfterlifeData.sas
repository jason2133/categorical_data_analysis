/* Belief Data */

data belief;
 input race $ gender $ belief count;
 datalines; 
W	F	1	371
W	F	2	49
W	F	3	74
W	M	1	250
W	M	2	45
W	M	3	71
B	F	1	64
B	F	2	9
B	F	3	15
B	M	1	25
B	M	2	5
B	M	3	13
;
run;

proc logistic data=belief; 
  class race(ref='B') gender(ref='M')/param=ref;
  freq  count;
  model belief(ref='3') = gender race  / link=glogit;   
  output out=predicted p=pi_hat;  
run;

proc print data=predicted;
run;


proc logistic data=belief; 
  class race(ref='B') gender(ref='M')/param=ref;
  freq  count;
  model belief(ref='3') = gender  / link=glogit;   
  output out=predicted p=pi_hat;  
run;

proc print data=predicted;
run;





