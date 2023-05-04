clear all;
clc;

%filter1 = filterInput();
filter1 = [1,1,1;1,1,1;1,1,1];
%filter2 = filterInput();
filter2 = [1,2,1;2,4,2;1,2,1];
 
a(filter1,filter2);

%filterSobelVertical = filterInput();
filterSobelVertical = [-1,0,1;-2,0,2;-1,0,1];
%filterSobelHorizontal = filterInput();
filterSobelHorizontal = [-1,-2,-1;0,0,0;1,2,1];
%filterPrewittVertical = filterInput();
filterPrewittVertical = [-1,0,1;-1,0,1;-1,0,1];
%filterPrewittHorizontal = filterInput();
filterPrewittHorizontal = [-1,-1,-1;0,0,0;1,1,1];

b(filterSobelVertical,filterSobelHorizontal,filterPrewittVertical,filterPrewittHorizontal);


