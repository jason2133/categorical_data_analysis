/*  Marijuana Data*/

data marijuana;
input race $ gender $ use $ count @@;
datalines;
White Female Yes 420
White Female No 620
White Male   Yes 483
White Male   No 579
Other Female Yes 25    
Other Female No 55
Other Male   Yes 32 
Other Male   No 62
;

proc genmod data=marijuana;
  freq count;
  class race(ref='Other') gender(ref='Female');
  model use(event='Yes') = gender race / dist=bin link=logit type3 lrci; 
run;


