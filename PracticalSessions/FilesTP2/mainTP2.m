%% Build your own bandit problem 

% this is an example, please change the parameters or arms!
Arm1=armBernoulli(0.1);
Arm2=armBeta(2,5);
Arm3=armExp(1.5);
Arm4=armFinite([0.1 0.2 0.6 0.9],[0.15 0.5 0.25 0.1]);
Arm5=armExp(.5);

MAB={Arm1,Arm2,Arm3,Arm4,Arm5};
% bandit : set of arms

NbArms=length(MAB);

Means=zeros(1,NbArms);
for i=1:NbArms
    Means(i)=MAB{i}.mean;
end



%% Comparison of the regret on one run of the bandit algorithm

n=10000; % horizon

alpha=.1;

maxrew=max(Means).*ones(1,n);

Nbiter=500;

rew1=zeros(Nbiter,n);
regret1=zeros(Nbiter,n);

for i=1:Nbiter
    [rew1(i,:),draws1]=UCB(n,alpha,MAB);
end

regret1=maxrew-1/Nbiter*sum(rew1);
regret1=cumsum(regret1);

% rew2=zeros(Nbiter,n);
% regret2=zeros(Nbiter,n);
% 
% for i=1:Nbiter
%     [rew2(i,:),draws1]=naive(n,MAB);
% end
% 
% regret2=maxrew-1/Nbiter*sum(rew2);
% regret2=cumsum(regret2);
% figure(1),
% plot(1:n,regret1,1:n,regret2);

% %% Choice of alpha
% 
% Nba=40;
% 
% %regret=zeros(Nba,1);
% %rew=zeros(Nbiter,n);
% 
% %for alpha=1:Nba
% %    for i=1:Nbiter
%  %       [rew(i,:),draws1]=UCB(n,alpha/Nba,MAB);
%   %  end
%    % reg=maxrew-1/Nbiter*sum(rew);
%     %regret(alpha)=sum(reg);
% %end
% 
% %figure(2);
% %plot((1:Nba)/Nba,regret);
% 
% 
% 
% %% Easy Problem
% 
% alpha=.1;
% tic
% Arm1=armBernoulli(0.5);
% Arm2=armBernoulli(0.6);
% Arm3=armBernoulli(0.4);
% 
% MABeasy={Arm1,Arm2,Arm3};
% NbArmseasy=length(MABeasy);
% Meanseasy=zeros(1,NbArmseasy);
% for i=1:NbArmseasy
%     Meanseasy(i)=MABeasy{i}.mean;
% end
% 
% rew1=zeros(Nbiter,n);
% regret1=zeros(Nbiter,n);
% 
% for i=1:Nbiter
%     [rew1(i,:),draws1]=UCB(n,alpha,MABeasy);
% end
% 
% regret1=maxrew-1/Nbiter*sum(rew1);
% regret1=cumsum(regret1);
% 
% rew2=zeros(Nbiter,n);
% regret2=zeros(Nbiter,n);
% 
% for i=1:Nbiter
%     [rew2(i,:),draws1]=Thomson(n,MABeasy);
% end
% 
% regret2=maxrew-1/Nbiter*sum(rew2);
% regret2=cumsum(regret2);
% 
% y=log(1:n)*complexity(MABeasy);
% figure(3),
% plot(1:n,regret1,1:n,regret2);
% toc
% 
% %% Difficult problem 
% 
% Arm1=armBernoulli(0.05);
% Arm2=armBernoulli(0.1);
% Arm3=armBernoulli(0.9);
% 
% MABdiff={Arm1,Arm2,Arm3};
% NbArmsdiff=length(MABdiff);
% Meansdiff=zeros(1,NbArmsdiff);
% for i=1:NbArmsdiff
%     Meansdiff(i)=MABdiff{i}.mean;
% end
% 
% rew1=zeros(Nbiter,n);
% regret1=zeros(Nbiter,n);
% 
% for i=1:Nbiter
%     [rew1(i,:),draws1]=UCB(n,alpha,MABdiff);
% end
% 
% regret1=maxrew-1/Nbiter*sum(rew1);
% regret1=cumsum(regret1);
% 
% rew2=zeros(Nbiter,n);
% regret2=zeros(Nbiter,n);
% 
% for i=1:Nbiter
%     [rew2(i,:),draws1]=Thomson(n,MABdiff);
% end
% 
% regret2=maxrew-1/Nbiter*sum(rew2);
% regret2=cumsum(regret2);
% 
% y=log(1:n)*complexity(MABdiff);
% figure(4),
% plot(1:n,regret1,1:n,regret2);
% 
% %% UCB versus Thompson Sampling

