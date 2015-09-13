% In this file, we construc the test cases for Quadrature formula.
%The test cases inlcude the vector of random variables, vector of equipspace and Chbyseve space (using cosine function)
% Create a vector of n+1 radom on interval [0, 1]
    function f = random(n)
        f= rand(n+1,1);
    end 
%Create vector of equipsaced on interval [0,1]
    function f = equispaced(n)
        f = transpose(linspace(0,1,n+1)); 
    end
%Create vector of Chebyshev on the interval [0,1]
    function f = chebyshev(n)
        a = transpose((0.5:n+0.5)); 
        f = (cos(a*pi/(n+1))+1)/2; 
    end 
%Construct a function which calculate the matrix of the given function, and
%also the weights of the function. 
    function f = Quad(x,a,b,m)
        s = (x-a)/(b-a); 
        %Construct the matrix for the function 
        A =(ones(m+1,1)*transpose(s)).^(transpose((0:m))*ones(1, length(x)));
       %integral of function
        c = ones(m+1,1)./transpose((1:m+1)); 
        %Calulate the weights
        w = transpose(A)*pinv(A*transpose(A))*c; 
        f = w*(b-a); 
    end
% A function which test the Quadrature formula, caluculate the maximum error 
% in integrating 1,x,x...,x^m. and f(x) = cos(10x). And it also plots the 
%result. 
    function test(fun, weights)
        p = 7; 
        n = (2*ones(1,p)).^(1:p); %n = 2,4,8,16,32,64,128
        m = cell(1:p); 
        max_error = cell(1:p); 
        cos_error = cell(1:p); 
        for i=1:p
            m{i} = n(i)/2:1:n(i); 
            f = fun(n(i)); 
            F = (ones(n(i)+1,1)*transpose(f)); 
            b = transpose((0:n(i)))*ones(1,length(f)); 
            A = F.^b; 
            integral = ones(n(i)+1,1)./transpose((1:n(i)+1)); 
            for j = 1:length(m{i})
                w = weights(f,0,1,m{i}(j)); %Quadrature weights  
                %Calulate the maximum error and error of cosin. 
                cos_error{i}(j) = abs(transpose(cos(10*f))*w-sin(10)/10); 
                max_error{i}(j) = max(abs(integral(1:m{i}(j)+1) -A(1:m{i}(j)+1,:)*w));
            end
            
        end         
    end
