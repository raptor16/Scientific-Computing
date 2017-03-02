m = [10:2:30];
flag =1 ; %only stable flag found is 1
time_elapsed = zeros(1,length(m));
matrix_size_1d = zeros(1, length(m));

for i = 1:length(m)
    [A, b] = poisson.getmatvec(m(i), flag);
    matrix_size_1d(i) = length(A)^2;
    tic;
    [L, U] = mylu (A);
    toc;
    time_elapsed(i) = toc;
end

figure;
loglog(matrix_size_1d, time_elapsed)
log_x = log(matrix_size_1d);
log_y = log(time_elapsed);
fit_model=fit(transpose(log_x), transpose(log_y), 'poly1');
% p = polyfit(matrix_size_1d,time_elapsed,1);
% time_fit = polyval(p, matrix_size_1d);
hold on;
plot(fit_model,matrix_size_1d, time_elapsed)


%%%%%%%
m = [10:2:30];

time_elapsed_fwd = zeros(1,length(m));
matrix_size_1d = zeros(1, length(m));
for i = 1:length(m)
    [A, b] = poisson.getmatvec(m(i), flag);
    matrix_size_1d(i) = length(A)^2;
    tic;
    L = myforwardsub(A, b);
    toc;
    time_elapsed_fwd(i) = toc;
end
figure;
loglog(matrix_size_1d, time_elapsed_fwd);
log_x = log(matrix_size_1d);
log_y = log(time_elapsed_fwd);
fit_model=fit(transpose(log_x), transpose(log_y), 'poly1');
% p = polyfit(matrix_size_1d,time_elapsed,1);
% time_fit = polyval(p, matrix_size_1d);
hold on;
plot(fit_model,matrix_size_1d, time_elapsed_fwd)
% hold on;
% p1 = 0.4787;
% p2 = -11.81;
% f = @(x) p1*log(x) + p2 ;
% fplot (f)
