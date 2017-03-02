m = [10:2:30];
flag =1 ; %only stable flag found is 1
time_elapsed = zeros(1,length(m));
matrix_size_1d = zeros(1, length(m));

for i = 1:length(m)
    [A, b] = poisson.getmatvec(m(i), flag);
    matrix_size_1d(i) = length(A);
    tic;
    [L, U] = mylu (A);
    toc;
    time_elapsed(i) = toc;
end

figure;
loglog(matrix_size_1d, time_elapsed)

m = [10:2:30];

time_elapsed_fwd = zeros(1,length(m));
matrix_size_1d = zeros(1, length(m));
for i = 1:length(m)
    [A, b] = poisson.getmatvec(m(i), flag);
    matrix_size_1d(i) = length(A);
    tic;
    L = myforwardsub(A, b);
    toc;
    time_elapsed_fwd(i) = toc;
end
figure;
loglog(matrix_size_1d, time_elapsed_fwd);

