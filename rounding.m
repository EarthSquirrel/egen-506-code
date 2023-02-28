%% Truncated solution to the Basal problem
% ... infinite sum of the squared reciprocal with an exact solution of pi^2/6
% 
% $$\sum_{n=1}^{\infty} \frac{1}{n^2} = \frac{\pi^2}{6}$$
% 
% comparing answer for N sums against the exact solution
% and the accumulating difference between an ascending and descending count

f1 = 0;
f2 = 0;
N = 100000;
for i = 1:N
    f1 = f1+1/i^2;
end
for i = N:-1:1
    f2 = f2 + 1/i^2;
end
e = pi()^2/6;

fprintf("values for f1 and f2 are:\nf1 = %.64g\nf2 = %.64g\n", f1, f2);
fprintf("\tan error from the exact: %g%%, %g%%\n", abs(f1-e)/e*100, abs(f2-e)/e*100);
fprintf("\tand a difference of: %g\n", f1-f2);
