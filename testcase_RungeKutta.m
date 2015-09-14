%These are the test cases for theta angle in the double pendulum, and I use Fourth-order Runge-Kutta method that integrates the 
%system y' = f(y).


%The function fpend(y) represents the equations of motion for the double pendulum. 
function ydot = fpend(y)
f = [y(3) y(4) (-3*sin(y(1))-sin(y(1)-2*y(2))-2*sin(y(1)-y(2))*((y(4)^2)+(y(3)^2)*cos(y(1)-y(2))))/(3-cos(2*y(1)-2*y(2))) (2*sin(y(1)-y(2))*(2*(y(3)^2)+2*cos(y(1))+(y(4)^2)*cos(y(1)-y(2))))/(3-cos(2*y(1)-2*y(2)))];
ydot = f; 
end

%Case 1: theta1(0) = 1, theta2(0) =1, omega1(0) = 0, omega2(0) = 0
h = 0.05;
alpha = [1 1 0 0];
N = 100/h;
t = 0; 
data = [t alpha];

    for i=1:N
        k1=h*fpend(alpha);
        k2=h*fpend(alpha+ k1/2);
        k3=h*fpend(alpha+ k2/2);
        k4=h*fpend(alpha+ k3);
        alpha = [alpha+(k1+2*k2+2*k3+k4)/6];
        t = t+h; 
        data = [data;t alpha];
    end
    plot(data(:,1), data(:,3));


%Case2: theta1(0) = pi, theta2(0) = 0, omega1(0) = 0, omega2(0) = 10^-10
h = 0.05;
alpha = [pi 0 0 10e-10];
N = 100/h;
t = 0; 
data = [t alpha];
    for i=1:N
        k1=h*fpend(alpha);
        k2=h*fpend(alpha+ k1/2);
        k3=h*fpend(alpha+ k2/2);
        k4=h*fpend(alpha+ k3);
        alpha = [alpha+(k1+2*k2+2*k3+k4)/6];
        t = t+h; 
        data = [data;t alpha];
    end
   plot(data(:,1), data(:,3));


%Case 3: theta1(0) = 2, theta2(0) = 2, omega1(0) = 1, omega2(0) = 0
h = 0.05;
alpha = [2 2 0 0];
N = 100/h;
t = 0; 
data = [t alpha];
    for i=1:N
        k1=h*fpend(alpha);
        k2=h*fpend(alpha+ k1/2);
        k3=h*fpend(alpha+ k2/2);
        k4=h*fpend(alpha+ k3);
        alpha = [alpha+(k1+2*k2+2*k3+k4)/6];
        t = t+h; 
        data = [data;t alpha];
    end
    plot(data(:,1), data(:,3));


%Case 4: theta1(0) = 2, theta2(0) = 2+10^-3, omega1(0) = 0, omega2(0) = 0
h = 0.05;
alpha = [2 (2+10e-3) 0 0];
N = 100/h;
t = 0; 
data = [t alpha];
    for i=1:N
        k1=h*fpend(alpha);
        k2=h*fpend(alpha+ k1/2);
        k3=h*fpend(alpha+ k2/2);
        k4=h*fpend(alpha+ k3);
        alpha = [alpha+(k1+2*k2+2*k3+k4)/6];
        t = t+h; 
        data = [data;t alpha];
    end
    plot(data(:,1), data(:,3));

%This will run the test case 1 with 5 different stepsizes. And for each stepsize, theta2(100). It also plots four errors as a function 
%of h in a loglog - plot. Furthermore, it will also estimates the order of convergence from the slop. 

k = [1 2 3 4];
array_h = [];
theta2 = [];
alpha = [1 1 0 0];
t = 0;
for i = 1: length(k)
    h = 0.05/(2^(k(i)-1));
    array_h = [array_h h]; 
    theta2 = [theta2 alpha(2)];
    for j = 1:length(array_h) 
        for x=1:(100/(array_h(j)))
        k1=array_h(j)*fpend(alpha);
        k2=array_h(j)*fpend(alpha+ k1/2);
        k3=array_h(j)*fpend(alpha+ k2/2);
        k4=array_h(j)*fpend(alpha+ k3);
        alpha = [alpha + (k1+2*k2+2*k3+k4)/6];
        t = t+array_h(j); 
        end    
        j = j+1; 
    end
    i = i+1; 
end 

array_h =[0.001 array_h];
for i = 1:(100/(array_h(1)))
        k1=array_h(1)*fpend(alpha);
        k2=array_h(1)*fpend(alpha+ k1/2);
        k3=array_h(1)*fpend(alpha+ k2/2);
        k4=array_h(1)*fpend(alpha+ k3);
        alpha = [alpha + (k1+2*k2+2*k3+k4)/6];
        t = t+array_h(1);  
end 
theta2= [alpha(2) theta2];
errors = abs(theta2 - array_h);
loglog(sort(array_h), errors, 'o-'); grid on
xlabel('errors'); ylabel('h');
slope=(log(errors(end-1))-log(errors(end)))/(log(array_h(end-1))-log(array_h(end)))
