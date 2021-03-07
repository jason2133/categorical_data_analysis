/* Baseball Data */


data baseball;
  input Boston NewYork Tampa Toronto Baltimore wins loses;
  tot=wins+loses;
  datalines;
       1      -1     0       0         0  12   6
       1       0    -1       0         0   6  12
       1       0     0      -1         0  10   8
       1       0     0       0        -1  10   8
       0       1    -1       0         0   9   9
       0       1     0      -1         0  11   7
       0       1     0       0        -1  13   5
       0       0     1      -1         0  12   6
       0       0     1       0        -1   9   9
       0       0     0       1        -1  12  6
  ;

proc genmod;
    model wins/tot = Boston NewYork Tampa Toronto Baltimore/
    dist=bin link=logit noint covb;
run;
