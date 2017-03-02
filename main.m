A = [2 1 0
     -1 2 -1
     0 -1 3];
% A = [2 1 1
%     4 3 3
%     8 7 10];

b = [1;-1;3];

%soliving for L and U matrices:
[L, U] = mylu(A);

% solving for forward substitution of A
x_f = myforwardsub (L, b);

% solving for backward substitution of A
x_b = mybackwardsub (U, b);

% solving the entire linear system
x = mylinearsolver(A, b);

%verify that this is the right answer by Ax = b --> x = A\b (y)