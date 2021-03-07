/* Mental Impairment Data */

data mental;
input impair ses life @@;
datalines; 
1 1 1  1 1 9  1 1 4  1 1 3  1 0 2
1 1 0  1 0 1  1 1 3  1 1 3  1 1 7
1 0 1  1 0 2  2 1 5  2 0 6  2 1 3
2 0 1  2 1 8  2 1 2  2 0 5  2 1 5
2 1 9  2 0 3  2 1 3  2 1 1  3 0 0
3 1 4  3 0 3  3 0 9  3 1 6  3 0 4
3 0 3  4 1 8  4 1 2  4 1 7  4 0 5
4 0 4  4 0 4  4 1 8  4 0 8  4 0 9
;
run;
/* impair: 1=well, 2=mild, 3=moderate, 4=impaired*/
/* SES: 1=high, 0=low */

proc logistic data=mental;
  class ses(ref='0')/ param=ref;
  model impair = life ses / link=clogit ;
  output out=predicted p=pi_hat; 
run;

proc print data=predicted;
run;

proc logistic data=mental;
  class ses(ref='0')/ param=ref;
  model impair = life ses life*ses/ link=clogit ; /* interaction included*/
run;





