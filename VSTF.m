function x=VSTF(x0,x,k)
% Binary V-Shaped transfer function for VSBAS antennae

r=0.1;
b=rand(k,1);
v=(x-x0).*b; 
Vs=abs((2/pi)*atan((pi/2)*v)); 
x(b<Vs)=~x(b<Vs); 
x(b>r)=x0(b>r); 