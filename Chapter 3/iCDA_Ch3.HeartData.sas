/* Heart Data*/

data heart;
input snoring disease total @@;
datalines;
0 24 1379 
2 35   638 
4 21   213 
5 30   254
;
proc print; 
run;


proc genmod; 
	model disease/total = snoring / dist=bin link=logit LRCI; /* logit link */
run;
proc genmod; 
	model disease/total = snoring / dist=bin link=probit LRCI; /* inverse cdf  link */
run;

proc genmod; 
	model disease/total = snoring / dist=bin link=identity LRCI; /* identify link */
run;


proc genmod; 
	model disease/total =  / dist=bin link=logit LRCI; /* logit link */ /* the null model with an intercept only */
run;


proc genmod; 
	model disease/total = snoring / dist=bin link=logit LRCI residuals; /* logit link */ /* Residuals */
run;

