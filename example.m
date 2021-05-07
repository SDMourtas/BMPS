function [n,K,s,X,xp]=example(x)
if x==1                   % Example 1
    n=30; K=[12;15];
    s=20;                 % number of delays for average and cov matrix
    X=xlsread('DJIA');    % stocks close prices (included delays)
elseif x==2               % Example 2
    n=40; K=[16;20];
    s=30;                 % number of delays for average and cov matrix
    X=xlsread('CAC40');   % stocks close prices (included delays)
elseif x==3               % Example 3
    n=20; K=[6;8];
    s=40;                 % number of delays for average and cov matrix
    X=xlsread('data');    % stocks close prices (included delays)
elseif x==4               % Example 4
    n=40; K=[14;18];
    s=40;                 % number of delays for average and cov matrix
    X=xlsread('data');    % stocks close prices (included delays)
elseif x==5               % Example 5
    n=70; K=[25;30];
    s=40;                 % number of delays for average and cov matrix
    X=xlsread('data');    % stocks close prices (included delays)
elseif x==6               % Example 6
    n=100; K=[40;45];
    s=40;                 % number of delays for average and cov matrix
    X=xlsread('data');    % stocks close prices (included delays)
end
X=X(:,1:n);
xp=zeros(n,1); xp(1:round(n/2))=1; % given portfolio