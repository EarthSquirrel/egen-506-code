function x = babylonianMethodSqrt(S,n)
%% x = babylonianMethodSqrt(S,n)
%
% solve for the square root of S using the 
% Babylonian method.
%
% S must be a positive number
% n determines the number of iterations to complete in minimizing the error


%S = 10000
%n = 15

x = S/2;
e = (S-x^2)/(2*x);
err = zeros(n,1);

for i = 1:n
    x = x + e;
    e = (S-x^2)/(2*x);
end
x = x+e;
% semilogy(1:n, err)

