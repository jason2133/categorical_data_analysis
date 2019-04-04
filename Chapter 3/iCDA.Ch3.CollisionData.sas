/* Collision data with counts and offset variable */

data train;
input year trainkm traincol trainroad;
        x=year-1975;  y = trainroad;
		logkm = log(trainkm);
datalines;
2003 518 0 3
2002 516 1 3
2001 508 0 4
2000 503 1 3
1999 505 1 2
1998 487 0 4
1997 463 1 1
1996 437 2 2
1995 423 1 2
1994 415 2 4
1993 425 0 4
1992 430 1 4
1991 439 2 6
1990 431 1 2
1989 436 4 4
1988 443 2 4
1987 397 1 6
1986 414 2 13
1985 418 0 5
1984 389 5 3
1983 401 2 7
1982 372 2 3
1981 417 2 2
1980 430 2 2
1979 426 3 3
1978 430 2 4
1977 425 1 8
1976 426 2 12
1975 436 5 2
;
run;

proc genmod;
	model y = x / dist=poi link=log offset=logkm ; /* Poisson regression with an offset variable */
run;

proc genmod;
	model y = x / dist=poi link=log offset=logkm scale=pearson; /* Poisson regression with an offset variable */
run;


proc genmod;
	model y = x  / dist=negbin link=log offset=logkm ;  /* NB regression with an offset variable */
run;


