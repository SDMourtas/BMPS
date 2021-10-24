%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  VSBAS source codes for the BMVPS problem (version 1.0 )          %
%                                                                   %
%  Developed in MATLAB R2018b                                       %
%                                                                   %
%  Author and programmer: S.D.Mourtas, V.N.Katsikis                 %
%                                                                   %
%   e-Mail: spirosmourtas@gmail.com                                 %
%           vaskatsikis@econ.uoa.gr                                 %
%                                                                   %
%   Main paper: S.D.Mourtas, V.N.Katsikis,                          %
%               "V-Shaped BAS: Applications on large portfolios     %
%               selection problem," Computational Economics (2021)  %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
close all
clc

x=1;  % Examples number: 1 to 6
[n,K,s,X,xp]=example(x);  

[t,xvsbas,xbbas,xbba,xbga,xvpso]=BMPS(X,s,xp,K,x);
