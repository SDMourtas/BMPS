function [A,b,p,w]=problem(t,X,Xm,Xc,K)
w=Xc{t+1};       % variance
A=Xm(t+1,:);     % expected return
b=-K(2)*mean(A); % target price
p=X(t+1,:)';     % market price