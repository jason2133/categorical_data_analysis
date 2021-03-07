/* Drug Data */

data drugs;
input a c m count @@;
datalines;
1 1 1 911 1 1 2 538 1 2 1 44 1 2 2 456
2 1 1    3 2 1 2   43 2 2 1   2 2 2 2 279
;
run;

proc genmod; 
  class a c m;
  model count = a c m / dist=poi link=log lrci type3 obstats; /*(A, C, M) model*/
run;


proc genmod; 
   class a c m;
  model count = a|m c|m / dist=poi link=log lrci type3 obstats; /*(AM, CM) model*/
run;

proc genmod; 
   class a c m;
  model count = a|m a|c c|m / dist=poi link=log lrci type3 obstats; /*(AM, AC, CM) model*/
run;

proc genmod; 
   class a c m;
  model count = a|c|m / dist=poi link=log lrci type3 obstats; /*(ACM) model*/
run;


