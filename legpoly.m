%create matrix using the rule of Legendre polynomial 
function [xi,w] = legpoly(n,x)
%we create a 1 row matrix with the same size as x 
    P(1,:) = ones(size(x)); 
%create one-row matrix of derivative of Legendre polynomial 
    dP(1,:)  = zeros(size(x)); 
%begin to set the rule of Legendre polynomial
    P(2,:) = x; 
    for j = 2:n
        P(j+1,:) = ((2*j-1)*x.*P(j,:) - (j-1)*P(j-1,:))/j;
        dP(j,:) = (j-1)*(x.*P(j,:) - P(j-1,:))./(x.^2-1);
    end
xi = sort(roots(P(n,:))); 
w(j) = 2*(1-xi(j))/(n+1)^2/xi(j).^2; 
