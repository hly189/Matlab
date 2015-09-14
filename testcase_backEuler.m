%These are the test case for the Euler backward method, and it also plot the graph to compare the fourth order of Runge_Kutta 
%method and Euler backward 

f=@(t,y) -y*sin(y);
df=@(t,y) -sin(y)-y*cos(y);
a=0; b=3; alpha=1; N=20; maxiter=20; tol=1e-12;
[t1,w1]=backeuler(f,df,a,b,alpha,N,maxiter,tol);
[t2,w2]=rk4(f,a,b,alpha,N);
plot(t1,w1,t2,w2)
legend('Backward Euler','Runge-Kutta 4')
