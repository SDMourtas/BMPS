% =========================================================% 
% The BMVPS problem setup and main procedure
%
% by S.D.Mourtas, V.N.Katsikis
% ======================================================== %
function [t,xvsbas,xbbas,xbba,xbga,xvpso]=BMPS(X,s,xp,K,x)

% Xm and Xc construction
[m,n]=size(X);tot=m-s;
Xm=zeros(tot,n);Xc{tot,1}={};
for i=1:tot
    r=X(i:s+i-1,:);
    rr=r./max(r);
    Xc{i,1}=cov(rr);
    Xm(i,:)=mean(rr);
end
X=X(s+1:end,:); % remove delays from market space

t=0:tot-1;

% VSBAS solutions
xvsbas=zeros(n,tot);fvsbas=zeros(1,tot);
tic
[A,b,p,w]=problem(t(1),X,Xm,Xc,K);
[xvsbas(:,1),fvsbas(1)]=VSBAS(xp,A,b,p,w,K,1e5,1e3,1e-6);
for i=2:tot
    [A,b,p,w]=problem(t(i),X,Xm,Xc,K);
    [xvsbas(:,i),fvsbas(i)]=VSBAS(xvsbas(:,i-1),A,b,p,w,K,1e5,1e3,1e-6);
end
toc

% BBAS solutions
xbbas=zeros(n,tot);fbbas=zeros(1,tot);
tic
[A,b,p,w]=problem(t(1),X,Xm,Xc,K);
[xbbas(:,1),fbbas(1)]=BBAS(xp,A,b,p,w,K,1e5,1e3,1e-6);
for i=2:tot
[A,b,p,w]=problem(t(i),X,Xm,Xc,K);
[xbbas(:,i),fbbas(i)]=BBAS(xbbas(:,i-1),A,b,p,w,K,1e5,1e3,1e-6);
end
toc

% BBA solutions
xbba=zeros(n,tot);fbba=zeros(1,tot);
tic
[A,b,p,w]=problem(t(1),X,Xm,Xc,K);
xbba(:,1)=BBA(30,.25,.1,n,1e3,@(x)MyCost(x,A,p,b,w,K,xp))';
fbba(1)=objfun(p,w,xbba(:,1),xp);
for i=2:tot
[A,b,p,w]=problem(t(i),X,Xm,Xc,K);
xbba(:,i)=BBA(30,.25,.1,n,1e3,@(x)MyCost(x,A,p,b,w,K,xbba(:,i-1)))';
fbba(i)=objfun(p,w,xbba(:,i),xbba(:,i-1));
end
toc

% BGA solutions
xbga=zeros(n,tot);fbga=zeros(1,tot);
tic
[A,b,p,w]=problem(t(1),X,Xm,Xc,K);
xbga(:,1)=bga(50,1e3,n,@(x)MyCost(x,A,p,b,w,K,xp))';
fbga(1)=objfun(p,w,xbga(:,1),xp);
for i=2:tot
[A,b,p,w]=problem(t(i),X,Xm,Xc,K);
xbga(:,i)=bga(50,1e3,n,@(x)MyCost(x,A,p,b,w,K,xbga(:,i-1)))';
fbga(i)=objfun(p,w,xbga(:,i),xbga(:,i-1));
end
toc

% VPSO solutions
xvpso=zeros(n,tot);fvpso=zeros(1,tot);
tic
[A,b,p,w]=problem(t(1),X,Xm,Xc,K);
xvpso(:,1)=BPSO(30,1e3,8,@(x)MyCost(x,A,p,b,w,K,xp),n)'; % VPSO
fvpso(1)=objfun(p,w,xvpso(:,1),xp);
for i=2:tot
[A,b,p,w]=problem(t(i),X,Xm,Xc,K);
xvpso(:,i)=BPSO(30,1e3,8,@(x)MyCost(x,A,p,b,w,K,xbba(:,i-1)),n)'; % VPSO
fvpso(i)=objfun(p,w,xvpso(:,i),xvpso(:,i-1));
end
toc

% Figures
erxvsbas=zeros(1,tot);erxbbas=zeros(1,tot);
erxbba=zeros(1,tot);erxbga=zeros(1,tot);
erxvpso=zeros(1,tot);varxvsbas=zeros(1,tot);
varxbbas=zeros(1,tot);varxbba=zeros(1,tot);
varxbga=zeros(1,tot);varxvpso=zeros(1,tot);
B=zeros(tot,1);
for i=1:tot
    erxvsbas(i)=xvsbas(:,i)'*Xm(i,:)';
    erxbbas(i)=xbbas(:,i)'*Xm(i,:)';
    erxbba(i)=xbba(:,i)'*Xm(i,:)';
    erxbga(i)=xbga(:,i)'*Xm(i,:)';
    erxvpso(i)=xvpso(:,i)'*Xm(i,:)';
    varxvsbas(i)=xvsbas(:,i)'*Xc{i}*xvsbas(:,i);
    varxbbas(i)=xbbas(:,i)'*Xc{i}*xbbas(:,i);
    varxbba(i)=xbba(:,i)'*Xc{i}*xbba(:,i);
    varxbga(i)=xbga(:,i)'*Xc{i}*xbga(:,i);
    varxvpso(i)=xvpso(:,i)'*Xc{i}*xvpso(:,i);
    [~,b,~,~]=problem(t(i),X,Xm,Xc,K);
    B(i)=-b;
end

figure
plot(t,erxvsbas);hold on
plot(t,erxbbas,'-.');plot(t,erxbba)
plot(t,erxbga,':');plot(t,erxvpso,':');plot(t,B,'k')
ylabel('Portfolios Expected Returns');xlabel('Time')
if x==1
    xticks([0 42 84 126 168 210 253])
    xticklabels({'2/1','4/3','4/5','2/7','1/9','30/10','4/1'})
elseif x==2
    xticks([0 42 84 126 168 210 256])
    xticklabels({'1/4','3/6','31/7','29/9','26/11','27/1','1/4'})
else
    xticks([0 19 41 62 82])
    xticklabels({'3/2','2/3','1/4','1/5','1/6'})
end
legend('VSBAS','BBAS','BBA','BGA','VPSO','Target price')
hold off

figure
plot(t,varxvsbas);hold on
plot(t,varxbbas,'-.');plot(t,varxbba)
plot(t,varxbga,':');plot(t,varxvpso,':');
ylabel('Variance');xlabel('Time')
if x==1
    xticks([0 42 84 126 168 210 253])
    xticklabels({'2/1','4/3','4/5','2/7','1/9','30/10','4/1'})
elseif x==2
    xticks([0 42 84 126 168 210 256])
    xticklabels({'1/4','3/6','31/7','29/9','26/11','27/1','1/4'})
else
    xticks([0 19 41 62 82])
    xticklabels({'3/2','2/3','1/4','1/5','1/6'})
end
legend('VSBAS','BBAS','BBA','BGA','VPSO')
hold off

figure
plot(t,abs(fvsbas-varxvsbas));hold on
plot(t,abs(fbbas-varxbbas),'-.')
plot(t,abs(fbba-varxbba))
plot(t,abs(fbba-varxbga),':')
plot(t,abs(fvpso-varxvpso),':')
ylabel('Transaction Costs');xlabel('Time')
if x==1
    xticks([0 42 84 126 168 210 253])
    xticklabels({'2/1','4/3','4/5','2/7','1/9','30/10','4/1'})
elseif x==2
    xticks([0 42 84 126 168 210 256])
    xticklabels({'1/4','3/6','31/7','29/9','26/11','27/1','1/4'})
else
    xticks([0 19 41 62 82])
    xticklabels({'3/2','2/3','1/4','1/5','1/6'})
end
legend('VSBAS','BBAS','BBA','BGA','VPSO')
hold off

figure
Y=[mean(fvsbas);mean(fbbas);mean(fbba);mean(fbga);mean(fvpso)];
bar(Y);
text(1:length(Y),Y,num2str(Y),'vert','bottom','horiz','center'); 
box off
ylabel('Average Price of Obj. Func.')
xlabel('Portfolio')
xticklabels({'VSBAS','BBAS','BBA','BGA','VPSO'})
hold off