function bearing_ODE()
% solve for the pressure distribution within a slipper-pad bearing with a linear change in height
% d/dx ( h^3 * dp/dx) = 6 * mu * u * dh/dx
% setup with a central finite difference and solved using MATLAB's built-in matrix inversion OR Gauss-Seidel
 close all
 clear var
 clc
 
    %% boundary conditions and problem parameters
    solver = 1; % 1 = direct, 2 = Gauss-Seidel
    p_0 = 0; % kPa
    p_L = 0; % kPa
    L = 0.1; % m
    H = 100e-6; % m
    mu = 1e-3; % Pa-s
    u = 1; % m/s
    a = 0.5; % slope of bearing wall
    
    %% repeated solving with different number of cells (N) to observe accuracy
    N = [1 3 5 19 99];
    lg = cell(size(N,1),1);

    figure(1); hold on;
    for j = 1:size(N,2) % looping over the differernt discretizations
        n = N(j);
        dx = L/n;
            x = 0:dx:L;
            h = H*(1-a*x/L);

        % initializing the A matrix and be vector with the boundary conditions
        A = zeros(n+1);
            A(1,1) = 1; 
            A(n+1,n+1) = 1;
        b = zeros(n+1,1);
            b(1) = p_0;
            b(n+1) = p_L;
        for i = 2:n % looping over all interior nodes to fill A and b
            W = (h(i)^3 - 3/4*h(i)^2*(h(i+1)-h(i-1)))/dx^2;
            E = (h(i)^3 + 3/4*h(i)^2*(h(i+1)-h(i-1)))/dx^2;
            at = -2*h(i)^3/dx^2;

            A(i,i-1:i+1) = [W at E];
            b(i) = 6*mu*u*(h(i+1)-h(i-1))/(2*dx);
        end
        
        % solving the problem and plotting the results
        switch solver
            case 1 % direct
                P = A^-1*b;
            case 2 % Gauss-Seidel
                P = GS(A,b,1e-9)
        end
        plot(0:dx:L, P, '-.');
        lg{j} = ['n=',num2str(N(j))];
    end
    
    % calculating and plotting the exact solution for comparison
    x = 0:dx/100:L;
    p = 6*mu*u*( L^3./(H^2*(L-a*x).^2*(1-(1-a)^2)) - L^2*x./(H^2*(L-a*x).^2) - L/(H^2*(1-(1-a)^2)));
    plot(x,p,'k');
    lg{size(N,2)+1} = 'Exact';
    legend(lg)
end

function P = GS(A,b, e) % Gauss-Seidel
% A*p = b, with e as error
    iter = 100000; % max number of iterations
        count = 0; % counter
    eps = 1e9; % starting error to prevent stopping early
    p = zeros(size(b,1),2);
    while eps > e && count < iter
        for i = 1:size(b,1)
            p(i,2) = b(i);
            for j = 1:size(b,1)
                if i ~= j
                    p(i,2) = p(i,2) - A(i,j)*p(j,1); 
                end
            end
            p(i,2) = p(i,2)/A(i,i);
        end
        eps = abs(rms(p(:,1))-rms(p(:,2)))/rms(p(:,2));
        p(:,1) = p(:,2);
        count = count + 1;
    end
%     count
    P = p(:,1);
end