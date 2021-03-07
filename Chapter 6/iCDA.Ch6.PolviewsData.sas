/*  Political View Data */

data Polviews;
input gender $ party $ ideology count @@;
datalines;
F D 1 44  F D 2 47  F D 3 118  F D 4 23  F D 5 32
F R 1 18  F R 2 28  F R 3 86   F R 4 39  F R 5 48
M D 1 36  M D 2 34  M D 3 53   M D 4 18  M D 5 23
M R 1 12  M R 2 18  M R 3 62   M R 4 45  M R 5 51
;
run;


proc logistic data=Polviews;
  class gender(ref='F') party(ref='R') /param=ref;
  freq count;
  model ideology =gender party / link=clogit;
  output out=predicted p=pi_hat; 
run;

proc print data=predicted;
run;



proc logistic data=Polviews;
  class party(ref='R') /param=ref;
  freq count;
  model ideology =party / link=clogit;
  output out=predicted p=pi_hat; 
run;

proc print data=predicted;
run;









