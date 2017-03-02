% We make the following assumptions:
% (1) Normality, (2) Homoscedasticity of the noise, and (3) indepence of
% noise between different points 

dt = 0.05;
%T = 10;
T = 1.0050e+03;

y = signal_sampler(dt, T);

w = 2;
t = [0:0.05:dt*(length(y)-1)];

%syms t a b c;
%f = symfun(a*cos(w*t)+b*sin(w*t) + c, [t a b c]);
y_model = @(t,a,b,c)  a*cos(w*t)+b*sin(w*t) + c;

% solving for y = X b  --> b = y\X ; y is column vector sample values
% where b is [a;b;c] which is what we are solving
% we need to find the matrix X
%[y1;y2;...;y201] = [cos(w t1) sin(w t1) 1 
%                    cos(w t2) sin(w t2) 1 
%                    etc..................] *[a;b;c]
%[201 by 1]       = [201 by 3]               [3 by 1]

X = zeros (length(y), 3);

for i = 1:3
    for j = 1:length(y)
        if i ==1
            X(j,i) = cos(w*t(j));
        elseif i ==2
            X(j, i) = sin(w*t(j));
        elseif i ==3
            X(j, i) = 1;
        end
    end
end

beta = X\y; % according to matlab: 
%"The \ operator performs a least-squares regression."
a = beta(1);
b = beta(2);
c = beta(3);

% plotting raw measuremnts
figure;
plot (t, y, '-o')
hold on;

% plotting f against t
f = @(t) a*cos(w*t) + b*sin(w*t) + c;
fplot (f );
axis([0 10 -1.35 2 ])
title ('Plot of a*cos(w*t)+b*sin(w*t) + c from raw measurements');
xlabel ('time');
ylabel ('f(t)');
legend ('raw data', 'model with best fit parameters', 'Location', 'Best');

% noise standard deviation estimate
% sigma_hat^2 = (1/(m-2))* (2-norm^2 of (X*beta - y))
% where xb -y is a vector of size 201x1
% ; m is the number of data points which is 201
m = length (y);
sigma_hat = sqrt( ( 1/(m-2) )*( norm(X*beta-y) ) );
%after running matlab, the value of sigma_hat = 0.1238

%confidence interval - 95% for each parameter 
big_sigma_hat = sigma_hat^2 * inv(transpose(X)*X);

% confidence interval associated with beta0 = a
I_0_lower =  a - (1.9720)*sqrt(big_sigma_hat(1,1));
I_0_higher = a + (1.9720)*sqrt(big_sigma_hat(1,1));
Interv_I0 = I_0_higher - I_0_lower;
half_I0 = Interv_I0/2;

% confidence interval associated with beta1 = b
I_1_lower = b - (1.9720)*sqrt(big_sigma_hat(2,2));
I_1_higher = b + (1.9720)*sqrt(big_sigma_hat(2,2));
Interv_I1 = I_1_higher - I_1_lower;
half_I1 = Interv_I1/2;

% confidence interval associated with beta2 = c
I_2_lower = c - (1.9720)*sqrt(big_sigma_hat(3,3));
I_2_higher = c + (1.9720)*sqrt(big_sigma_hat(3,3));
Interv_I2 = I_2_higher - I_2_lower;
half_I2 = Interv_I2/2;
% where m-2 is 199 and t_gamma,m-2 is 1.9720 from the t-tables

% we wish t reduce the confidence interval for each parameter by a factor
% of 10. 
desired_I0 = Interv_I0/10;
desired_I1 = Interv_I1/10;
desired_I2 = Interv_I2/10;
% How long should we sample the signal -> dt=0.5, T=? 
%Approach: keep increasing T by 1 until desried CI is reached??? How else?
%recusive...runtime is gonna be slow-ish.. idk
%manually input t table 

% confidence interval scales as 1/ sqrt(m) ; m is the data points so if 
% confidence scales  decreases by factor of 10, then 
% ci/desired ci = 10 = 1/sqrt(201) / (1/sqrt(m_new)) find m
%100 = 1/201 / 1/m_new --> m_new/201 = 100
% for all param?
m_new = 201*100; % m is number of points 
% T_new/dt + 1 = m_new ; dt = 0.05
% so 
T_new = (m_new -1)*dt;
% !!!! This is wrong, write the expression for student's t distribution!
% only a factor of 2 for some reason???

% recompute the confidence interval for T_new by simply changing the T
% value at the top of the function. ssss



