function [L, U] = mylu(A)
n = length(A);
U = A; 
L = eye(n);
for i = 1:(n-1) % i is from 1 to 2 in 3x3 -- 1,2
    for j = (i+1):n % from i to 3 in a 3x3 --1:3, 2:3
        L(j,i)=U(j,i)/U(i,i); 
        %L(1,1) = U(1,)
        for k = i:n % from i to 3 in 3x3 -- 1:3, 2:3
            U(j,k) = U(j,k) - L(j,i)*U(i,k);
        end
    end
end
end