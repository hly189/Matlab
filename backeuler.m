%This is Euler backward method using Newton method. 

function [t,w] = backeuler(f,df,dy,a,b,alpha,N,maxiter,tol)
h = (b-a)/N;
t = a:h:b;
w = zeros(1,N+1);
w(1) = alpha;
for i = 1:N
    g =@(t,u)  u- w(i) - h*f(t(i+1),u);
    dg =@(t,u) 1-h*dfdy(t(i+1),u);
    w(i+1) = newton(g,dg,w(i),a,b,N,tol,maxiter);
end

