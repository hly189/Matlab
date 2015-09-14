%This function use the newton method to calculate t1 and t2 for natural cubic spline. 

function t=cubnicnewton(x,a,b,c,d,t0,tol,yval)
while 1 
    t = t0 + (yval-splineeval(x,a,b,c,d,t0))/diffsplineeval(x,a,b,c,d,t0);
    if abs(t-t0)<tol,break;end
    t0=t;
end
