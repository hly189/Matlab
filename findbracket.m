%This function is the improved version of Newton method. 

function [a,b]=findbracket(f,x0)
a = x0; 
b = x0; 
dx = 0.001;
while 1
    a = a - dx; 
    if f(a)*f(b) < 0; break; end
    b = b + dx; 
    if f(a)*f(b) < 0; break; end
    dx = dx*2
end
