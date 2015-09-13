%This file sets the test function for Quadrature formula in programming.m file 

%Set the test function. 
f=@(x) 1/(6 - 5*cos(x));
%Construct the integral of Gaussian-Legendre rule with the test function 
%and with the oder of q = 20. 
[xi,wi,point] = Gaussian_Legendre(-1,1,f,20)
