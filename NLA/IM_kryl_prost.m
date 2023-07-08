%%uloha 1
A = [10 0 0 0;
    0 -9 0 0;
    0 0 8 0;
    0 0 0 9]
v = ones(4,1);
i = 2;

[ V,H ] = Arnoldi( v,A,i );

%% uloha 2
A = [3 0 0;
    0 9 0;
    0 0 -5];
v = ones(3,1);
i = 5;

[ V,H ] = Arnoldi( v,A,i );

%% uloha 3
A = [1 0 0 0;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1]
v = [1/2 ; 1/3 ; 1/5 ; 1/7];
i = 6;

[ V,H ] = Arnoldi( v,A,i );