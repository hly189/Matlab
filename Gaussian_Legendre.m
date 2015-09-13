%This function construc the roots, weights, and determining the integral of
%Gaussian-Legendre polynomial. 
function [xi,wi,points] = Gaussian_Legendre(a,b,f,order)
%create the pint theta in the interval [-1,1]
x = linspace(-1,1,order+1)
%Constructs the roots and weights of Legendre polynomial 
[xi,wi] = legpoly(order,x); 
%Determine the integral of of Legendre polynomial
points = sum(f(xi)*wi')
end 
