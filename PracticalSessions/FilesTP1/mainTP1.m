%% Problem setting 

M = 15; % taille du stock
K = 0.8; % frais de livraison
c = 0.5; % prix d'achat
h = 0.3; % coût d'entretien
pr = 1; % prix de vente
gamma = 0.98; % calculé à partir du taux d'inflation

p = 0.1; % paramètre de la loi géométrique
D=zeros(1,M+1); % vecteur de la loi géométrique (tronquée)
D(1+(0:(M-1)))=p*(1-p).^(0:(M-1));
D(M+1)=1-sum(D);

x0=M; % stock initial

%% Visualisation d'une trajectoire

%pi=2*ones(1,M+1);
pi=ceil(rand(1,M+1)*10);%exemple de politique
n=1000;

[X,R] = trajectory(n,x0,pi,D,M,K,h,c,pr);

figure(1),
plot(cumsum(gamma.^((1:n-1)-1).*R))

% Estimation du la récompense cumulée discountée
Ntraj=100;
X=zeros(Ntraj,n);
R=zeros(Ntraj,n-1);
G=zeros(Ntraj,n-1);
for j=1:Ntraj
    G(j,:)=gamma.^((1:n-1)-1);
end

for i=1:Ntraj
    [X(i,:),R(i,:)]=trajectory(n,x0,pi,D,M,K,h,c,pr);
end
V1=1/Ntraj*sum(sum(G.*R,2),1);

%% Calcul des paramètres du MDP

[P,R]=MDP(D,M,K,h,c,pr);

%V2=pol_eval(pi,P,R,M,gamma);
    

%% Value iteration

nb_it=100;
V0=zeros(M+1,1);

tic
[Vvi pol_vi]=VI(P,R,gamma,V0,nb_it,M);
toc


%% Policy iteration 

pi0=ones(M+1,1);

[Vpi pol_pi]=PI(P,R,gamma,pi0,nb_it,M);

V=Vpi*ones(1,nb_it);
vpi=zeros(M+1,nb_it);
vvi=zeros(M+1,nb_it);
for k=1:nb_it
    [vpi(:,k),p]=PI(P,R,gamma,pi0,k,M);
    [vvi(:,k),p]=VI(P,R,gamma,V0,k,M);
end

diffvi=max(V-vvi);
diffpi=max(V-vpi);

figure(2)
plot(1:nb_it,diffvi,1:nb_it,diffpi,'--');

%% Q-Learning

n=1000000;

A=ceil(rand(1,n)*(M+1));
[X,R] = trajectorya(n,x0,A,D,M,K,h,c,pr);
Q=Qlearning(M,gamma,X,A,R);
