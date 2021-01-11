% =========================================================% 
% VSBAS by S.D. Mourtas, V.N. Katsikis
%
% "V-Shaped BAS: Applications on large portfolios selection
% problem," (submitted)
%
% appropriately modified for the BMPS problem.
% ======================================================== %
function [xbest,fbest] = VSBAS(x0,A,b,p,w,K,R,tmax,tol)
% VSBAS: V-shaped transfer function-based binary beetle antenna searching 
% for global minimum 

x1=x0;
k=length(x0);
%x11=ones(size(x0));
t=0;

% iteration
while t<tmax %&& norm(penfun(x11,A,b,p,w,K,R,x1)-penfun(x0,A,b,p,w,K,R,x1),2)>tol
    c=round(rands(k,1));
    xr=x0+c; xr(xr>1)=1; xr(xr<0)=0;
    xl=x0-c; xl(xl>1)=1; xl(xl<0)=0;
    xr=VSTF(x0,xr,k);
    xl=VSTF(x0,xl,k);
    if penfun(xr,A,b,p,w,K,R,x1)<penfun(xl,A,b,p,w,K,R,x1)
        x=xr;
    else
        x=xl;
    end
    if penfun(x,A,b,p,w,K,R,x1)<penfun(x0,A,b,p,w,K,R,x1)
        %x11=x0;
        x0=x; 
    end
    t=t+1;
end
xbest=x0;
fbest=objfun(p,w,xbest,x1);