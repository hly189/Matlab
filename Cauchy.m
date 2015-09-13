function C=Cauchy(x,y)
%This function create the Cauchy matrix and mainly use for testing Fast Multipole method 
C=zeros(length(x));
for i=1:length(x)
    for j=1:length(y)
        C(i,j)=1/(x(i)+y(j));
    end
end
