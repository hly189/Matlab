%This is the test case for findbracket and newtonbisection method from -3 to 10 and the error is 10^-8

f=@(x) sin(x)-exp(-x);
df=@(x) cos(x)+exp(-x);
for x0=-3:10
[a,b]=findbracket(f,x0);
x=newtonbisection(f,df,a,b,1e-8);
[x0,a,b,x]
end
