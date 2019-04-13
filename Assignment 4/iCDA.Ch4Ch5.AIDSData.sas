/*  AIDS Data*/


data aids;
input race $ azt $ symptom $ count @@;
datalines;
White Yes Yes 14 
White Yes No 93 
White No   Yes 32 
White No   No 81 
Black Yes Yes 11   
Black Yes No 52   
Black No   Yes 12 
Black No   No 43 
;

proc genmod data=aids; 
  freq count;
  class race(ref='Black') azt(ref='No');
  model symptom(event='Yes') = azt race / dist=bin link=logit type3 lrci; /*using logit model - conditional: symptom vs azt given race*/
run;


data aids2;
input race $ azt $ y n @@;
datalines;
White Yes 14  107 
White No   32 113 
Black Yes 11   63 
Black No   12   55
;

proc genmod data=aids2; 
  class race(ref='Black') azt(ref='No');
  model y/n = azt race / dist=bin link=logit type3 lrci; /*conditional: symptom vs azt given race*/
run;

