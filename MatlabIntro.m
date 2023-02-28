clear all
close all
clc

% anything behind a percent-sign is a comment and will not be evaluated
% two percent signs (%%) at the start of a line denote a new section

%% Fibonacci Counter
F = [0,1]; % initialize the sequence since they do not directly follow the pattern
n = 20;
for i = 3:n % starting at index 3 because MATLAB starts an array with an index of 1 *(some languages start at 0)
    F(i) = F(i-2) + F(i-1);
end
display('The Fibonacci Series')
F % no semicolon, so this line will be spit out to the command window


%% Plot the first n terms in the Fibonacci sequence
figure(1) % can also use empty parentheses to add a new figure with the next free index
plot(1:n, F)
title(['The first ', num2str(n), ' terms in the Fibonacci Sequence']);
xlabel('Term #');
ylabel('Fibonacci #');


%% Creating an array
% columns are separated by spaces or commas, rows by semicolons
A = [1 2 3; 4, 5, 6]; % a 2x3 (2 row, 3 column) array

% A*A multiplies matrices with dimension (2x3)(2x3), which breaks linear algebra
% A*A' or A*transpose(A) will produce a 2x2 matrix
% A.*A = A.^2 (the period matters) is not linear algebra, but a per-cell operation 
%       and will multiply the individual cells together, e.g., A(2,3)*A(2,3) = A(2,3)^2


%% Compute 5! (factorial)
x = 1; % 0! = 1! = 1. If we don't define, x could take any number
for i = 2:5 % loop from 2 to 5 by the default step-size = 1
    x = x*i;
end
display(['5 factorial is: ', num2str(x)]);


%% Compute 1/x for x = 0.25 through an infinite sum Taylor Series
x_inv = 0; % initial value for inverse solution
x = 0.25; 
n = 50; % number of steps
for i = 0:1:n % loop from zero to n by the specific step-size = 1
    x_inv = x_inv + (-1)^i*(x-1)^i;
end
fprintf("The infinite sum approximation for 1/%g to first %d terms is:\n\t%0.5d\n", x, n, x_inv);
