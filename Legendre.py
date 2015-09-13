#This file uses python to construct the Gaussian Legendre polynomial
#The error in this polynomial is at 10^-20, and it can take up to 25 points to calculate the weight of the function


from numpy import *

#Define the test function: 
def func(x): 
    return 1/(6 - 5*cos(x))

# Legendre polynomial  
def Legendre(n,x): 
	x = array(x)
	if (n == 0):
	   return x*0 + 1
	elif(n==1):
	   return x
	else: 
	   return ((2.0*n-1.0)*x*Legendre(n-1,x)-(n-1)*Legendre(n-2,x))/n

#Derivative of Legendre polynomial 
def derivative_Legendre(n,x): 
    x = array(x)
    if(n==0): 
        return x*0
    elif(n==1): 
        return x*0 +1
    else: 
        return (n*(x*Legendre(n,x) - Legendre(n-1,x)))/(x**2 -1)
        
#Roots of the polynomial, we obtain it by using Newton method 
def poly_root(order, tolerance = 1e-20): 
    if order < 2: 
        error =1
    else: 
        root = []
        for i in range(1, int(order)/2 + 1): 
            x=0.00001 #we set x0 to be nearest zeros. 
            error = 10*tolerance
            iters = 0
            while (error > tolerance) and (iters < 1000): 
                dx = - Legendre(order, x)/(derivative_Legendre(order,x))
                x = x + dx
                iters = iters +1 
                error = abs(x)
            root.append(x)
        root = array(root)
        if order%2==0:
	   root=concatenate( (-1.0*root, root[::-1]) )
	else:
	   root=concatenate( (-1.0*root, [0.0], root[::-1]) )
	error=0 
    return [root, error]

#Compute the weights of Legendre polynomial 
def weights(order): 
    [xi, error] = poly_root(order)
    wi = []
    if error == 0: 
        wi = 2/((1 - xi**2)*(derivative_Legendre(order, xi))**2)
        error = 0 
    else: 
        error  =1 
    return [xi, wi, error]

#Compute the integral of Gaussian Legendre polynomial. 
def Gaussian_Legendre(a,b,func, order): 
    [wi, xi, error] = weights(order)
    if error == 0: 
        points = sum(wi*func(xi))
    else: 
         error =1
         points = None
    return [points, error]
   
order = 10

[Ws,xs,err]=weights(order)
if err==0:
	print "Order    : ", order
	print "Roots    : ", xs
	print "Weights  : ", Ws
else:
	print "Roots/Weights evaluation failed"
 
# Integrating the function
[ans,err]=Gaussian_Legendre(1 , -1, func, order)
if err==0:
	print "Integral : ", ans
else:
	print "Integral evaluation failed" 
