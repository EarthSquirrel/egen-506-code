function [x1,x2] = manualSqrt(a,b,c)
%% [x1, x2] = manualSqrt(a,b,c)
%
% solves for the two roots (x1 and x2) of the polynomial
% ax^2 + bx + c = 0

% initialize the variables
x1 = 0;
x2 = 0;
S = @babylonianMethodSqrt; % shorten the name of the function

if a == 0 % check if not a quadratic equation
    if b ~= 0 % check if a linear equation
        x1 = -c/b;
        x2 = 'N/A';
    else % a horizontal line at y = c
        display('There are no roots');
        return;
    end
else % quadratic and needs solved
    discr = b^2 - 4*a*c;
    s = S(abs(discr),4); 
    if discr >= 0 % real number solution
        x1 = (-b-s)/(2*a);
        x2 = (-b+s)/(2*a);
    else % imaginary solution
        x1 = -b/(2*a);
        x2 = x1;
        x1 = x1 - s/(2*a)*i;
        x2 = x2 + s/(2*a)*i;
    end
end
display(['Your two roots are: ', num2str(x1), ' and ', num2str(x2)])