/* Accident Data */

data injury;
input G $ L $ S $ I $ count @@;
datalines;
F U N N 7287 F U N Y 996
F U Y N 11587 F U Y Y 759
F R N N 3246 F R N Y 973
F R Y N 6134 F R Y Y 757
M U N N 10381 M U N Y 812
M U Y N 10969 M U Y Y 380
M R N N 6123 M R N Y 1084
M R Y N 6693 M R Y Y 513
;
run;

proc genmod; 
  class G L S I;
  model count = G|I G|L G|S I|L I|S L|S / dist=poi link=log lrci type3 obstats; 
run;


proc genmod; 
  class G L S I;
  model count = G|L|S G|I I|L I|S / dist=poi link=log lrci type3 obstats; 
run;


proc genmod; 
  class G L S I;
  model count = G I L S / dist=poi link=log lrci type3 obstats; 
run;


proc genmod; 
  class G L S I;
  model count = G|I|L G|I|S G|L|S I|L|S / dist=poi link=log lrci type3 obstats; 
run;


proc genmod; 
  class G L S I;
  model count = G|I|L G|S I|S L|S / dist=poi link=log lrci type3 obstats; 
run;


proc genmod; 
  class G L S I;
  model count = G|I|S G|L I|L L|S / dist=poi link=log lrci type3 obstats; 
run;


proc genmod; 
  class G L S I;
  model count = G|L|S G|I I|L I|S / dist=poi link=log lrci type3 obstats; 
run;


proc genmod; 
  class G L S I;
  model count = I|L|S G|I G|L G|S / dist=poi link=log lrci type3 obstats; 
run;

