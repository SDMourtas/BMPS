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
%               selection problem," (submitted)                     %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
close all
clc

n=20; K=[6;8];    % Example 1: 20 stocks market
%n=40; K=[14;18];  % Example 2: 40 stocks market
%n=70; K=[25;30];  % Example 3: 70 stocks market
%n=100; K=[40;45]; % Example 4: 100 stocks market

s=40;                 % number of delays for average and cov matrix
X=xlsread('data');    % stocks close prices (included delays)
X=X(:,1:n);
xp=zeros(n,1); xp(1:round(n/2))=1; % given portfolio

[t,xvsbas,xbbas,xbba,xbga,xvpso]=BMPS(X,s,xp,K);