/* Table A.1*/

data clinical;
input response $ count;
datalines;
yes 1
no 9
;

proc freq data=clinical; weight count;
 	tables response / binomial(WALD LR SCORE EXACT midp) alpha=.05; 
run;


proc freq data=clinical; weight count; exact binomial; 
	tables response / binomial (p= 0.5);
run;

