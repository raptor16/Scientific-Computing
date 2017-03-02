function x = mylinearsolver(A, b)

    %Ax = b, while A = LU, and Lx = b, Ux = z
    [L, U] = mylu(A);
    z = myforwardsub (L, b);
    x = mybackwardsub (U, z);
    
end
