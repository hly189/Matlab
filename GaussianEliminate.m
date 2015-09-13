function [x] = GaussianEliminate(A, b)
N = length(b);

%Gaussian elimination 
for column = 1:(N-1)
    %rows below the diagonal element
    for row = (column+1):N
        %values of d
        d = A(row, column) / A(column, column); 
        %row operation
        A(row,:) = A(row,:) -d*A(column,:); 
        b(row) = b(row) -d*b(column);
    end 
end 

%backward subtituion
 return 
