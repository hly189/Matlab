%This file sets the test function for Quadrature formula in programming.m file
% The error of the test function should be around 10^-6


function test(func, func_def)
points = 7; 
n = (2*ones(1,points)).^(1:points); 
style = {'k.', 'k+', 'k*', 'kx', 'ks', 'kd'}; 
clf; 
m = cell(1,points); 
max_error = cell(1, points); 
cos_error = cell(1, points); 
for i = 1:points
    m{i} = n(i)/2:max(1,n(i)/32:n(i)); 
    x = func(n(i)); 
    F = (ones(n(i) +1, 1)*x').^((0:n(i))'*ones(1, length(x))); 
    anti_derivative = ones(n(i)+1,1)./(1:n(i)+1)'; 
    c = cos(10*x); 
    max_error{i} = 0*m{i}; 
    cos_error{i} = 0*m{i}; 
    for j = 1:length(m{i})
        w = func_def(x,m{i}(j), 0, 1); 
        max_error{i}(j) = max(abs(anti_derivative(1:m{i}(j) +1) - F(1:m{i}(j)+1,:)*w)); 
        cos_error{i}(j) = abs(c'*w - sin(10)/10);
    end  
hold on;
plot(m{i}, log10(max_error{i}), style{i}); 
axis([0 130 -17 1]); 
end 
end 
