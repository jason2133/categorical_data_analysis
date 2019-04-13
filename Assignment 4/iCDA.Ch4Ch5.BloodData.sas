/*  Blood Pressure Data*/

data heart;
input pressure total ndisease;
label pressure='협압'  total='표본수' ndisease='질병자수';
cards;
111.5 156  3
121.5 252 17
131.5 284 12
141.5 271 16
151.5 139 12
161.5  85  8
176.5  99 16
191.5  43  8
;

proc logistic data=heart; /* using logistic procedure */
   model ndisease/total =  pressure/influence; /*Influence diagonostics*/
run;

proc genmod data=heart; /* using genmod procedure */
   model ndisease/total =  pressure/dist=binomial link=logit influence; /*Influence diagonostics*/
run;


