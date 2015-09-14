%This function is the combined between newton and bisection method

function p=newtonbisection(f, df, a, b, tol)
p = a
while 1
    p = p - f(p)/df(p); 
    if p < a || p >b
        p = (a+b)/2; 
    end
    if f(a)*f(b)<0
        a = p; 
    else
        b = p; 
    end
    if abs(f(b))<0, break; end
end
