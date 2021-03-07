/* Presidential Votes*/

data matched;
input taxes living count @@;
datalines;
1 1 227 1 2 132 2 1 107 2 2 678
;

proc freq; weight count;
	tables taxes*living / agree; exact mcnem;
run;

proc catmod; weight count;
	response marginals;
	model  taxes*living = (1 0 , 1 1 ) ;
run;



