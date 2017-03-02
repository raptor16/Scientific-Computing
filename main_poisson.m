flag = 1;
m = 3;
[A1, b1] = poisson.getmatvec(m, flag);
eig_value1 = eig(A1);
if min(eig_value1) > 0
    Is_positive_def_A1 = 1;
else 
    Is_positive_def_A1 = 0;
end
Is_symmetric_A1 = issymmetric(A1);
if Is_positive_def_A1 ==1 && Is_symmetric_A1==1
    is_SPD_A1 = 1;
else 
    is_SPD_A1 = 0;
end

m = 5;
[A2, b2] = poisson.getmatvec(m, flag);
eig_value2 = eig(A2);
if min(eig_value2) > 0
    Is_positive_def_A2 = 1;
else 
    Is_positive_def_A2 = 0;
end
Is_symmetric_A2 = issymmetric(A2);
if Is_positive_def_A2 ==1 && Is_symmetric_A2==1
    is_SPD_A2 = 1;
else 
    is_SPD_A2 = 0;
end

m = 9;
[A3, b3] = poisson.getmatvec(m, flag);
eig_value3 = eig(A3);
if min(eig_value3) > 0
    Is_positive_def_A3 = 1;
else 
    Is_positive_def_A3 = 0;
end
Is_symmetric_A3 = issymmetric(A3);
if Is_positive_def_A3 ==1 && Is_symmetric_A3==1
    is_SPD_A3 = 1;
else 
    is_SPD_A3 = 0;
end

%%
%Solving the problems (a) m = 3, flag = 0; (b) m= 3, flag = 1

m = 3;
flag = 0;
[A1, b1] = poisson.getmatvec(m, flag);

%x1 = mylinearsolver(A1, b1);
x1=A1\b1;
poisson.vizsoln(x1,flag);
%%%%%%%%%%%
m = 3 ;
flag = 1;
[A2, b2] = poisson.getmatvec(m, flag);

%x2 = mylinearsolver(A2, b2);
x2=A2\b2;
poisson.vizsoln(x2,flag);
%%%%%%%%%%
m = 9 ;
flag = 0;
[A3, b3] = poisson.getmatvec(m, flag);

%x3 = mylinearsolver(A3, b3);
x3=A3\b3;
poisson.vizsoln(x3,flag);
%%%%%%%%%%%%%
m = 9 ;
flag = 1;
[A4, b4] = poisson.getmatvec(m, flag);

%x4 = mylinearsolver(A4, b4);
x4=A4\b4;
poisson.vizsoln(x4,flag);
%%%%%%%%%%
m = 18 ;
flag = 0;
[A5, b5] = poisson.getmatvec(m, flag);

x5 = mylinearsolver(A5, b5);
x5 = A5\b5;
poisson.vizsoln(x5,flag);
%%%%%%%%%
m = 18 ;
flag = 1;
[A6, b6] = poisson.getmatvec(m, flag);

%x6 = mylinearsolver(A6, b6);
x6 = A6\b6;
poisson.vizsoln(x6,flag);




