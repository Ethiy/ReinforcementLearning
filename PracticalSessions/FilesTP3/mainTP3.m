%%Adversarial Problem setting 

G = [2 -1  ; 0  1]; % gain matrix for player A
n=1000; % horizon 

eta=1;
Nbiter=100;
beta=1;


%%Oblivious adversary (EWF and EXP3)

% Define the Sequence of Player B
Seq =1+binornd(1,1/2,1,n);

maxrew=maxA(n,G,Seq);
rewards1=zeros(Nbiter,n);
regret1=zeros(Nbiter,n);

for i=1:Nbiter
    [Actions1,rewards1(i,:)]=EWFplay(n,G,eta,Seq);
end

regret1=maxrew-1/Nbiter*sum(rewards1);
regret1=cumsum(regret1);

rewards2=zeros(Nbiter,n);
regret2=zeros(Nbiter,n);

for i=1:Nbiter
    [Actions2,rewards2(i,:)]=EXP3play(n,G,eta,beta,Seq);
end

regret2=maxrew-1/Nbiter*sum(rewards2);
regret2=cumsum(regret2);

figure(1),
plot(1:n,regret1,1:n,regret2);
%%EXP 3 versus EXP 3 : nash equilibrium

[ActionsA,ActionsB,Rew]= EXP3vEXP3(n,eta,beta,G);

pa=ones(1,n);
for j=1:n
    if ActionsA(j)>1
        pa(j)=0;
    end
end
pa=cumsum(pa);

for j=1:n
    pa(j)=pa(j)/j;
end

pb=ones(1,n);
for j=1:n
    if ActionsB(j)>1
        pb(j)=0;
    end
end
pb=cumsum(pb);

for j=1:n
    pb(j)=pb(j)/j;
end

figure(2),
plot(1:n,pa,1:n,pb);

rew=cumsum(Rew);
for j=1:n
    rew(j)=rew(j)/j;
end

figure(3),
plot(1:n,rew);

%%EXP3 versus Thompson Sampling

Arm1=armBernoulli(0.2);
Arm2=armBernoulli(0.4);
Arm3=armBernoulli(0.5);

MAB={Arm1,Arm2,Arm3};

Means=[Arm1.mean Arm2.mean Arm3.mean];
mumax=max(Means);

eta=0.01;
beta=0.1;

N=500;
n=1000;

% Estimated cumulated regret up to time n


    
    
    
    
    

