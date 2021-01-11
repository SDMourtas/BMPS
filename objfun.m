function f=objfun(p,w,x,x1)
f=x'*w*x+sum((x>x1).*(0.03+0.07*(x-x1).*p)+(x<x1).*(0.03+0.05*(x1-x).*p));