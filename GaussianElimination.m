function x = GaussianElimination(A,b)
%% GaussianElimination: solve Ax=b through row elimination
%   x = GaussianElimination(A,b)
%   A = square matrix, NxN
%   b = right-hand side column vector, Nx1
%   x = solution vector, Nx1

[m,n] = size(A);
if m~= n 
    error('Matrix A must be square');
end
x = zeros(size(b));

%% forward elimination
tic
for i = 1:n
%     % naive GE
%     if A(i,i) == 0
%         error('Divide by zero along the diagonal');
%     end
    
    %partial pivoting
    [big, idx] = max(abs(A(:,i)));
    if A(idx,i) == 0
        error('no unique solution to system');
    elseif idx > i
        A([i,idx],:) = A([idx,i],:);
        b([i,idx]) = b([idx,i]);
    end
    
    for j = i+1:n
        lamda = A(j,i)/A(i,i);
        for k = i:n
            A(j,k) = A(j,k) - lamda*A(i,k);
        end
        b(j) = b(j) - lamda*b(i);
    end
end
toc

%% backward substitution
tic
for i = n:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum + A(i,j)*x(j);
    end
    x(i) = (b(i) - sum)/A(i,i);
end
toc
