function [X,R] = trajectorya(n,x0,A,D,M,K,h,c,pr)
% genere a trajectory X of length  n in the MDP 
% X sequence of states
% R sequence of associated rewards  
% x0 initial state
% A sequence of actions
R=zeros(1,n-1);
X=zeros(1,n);
X(1)=x0;
for i=1:n-1
    dt=simu(D);
    R(i)=Reward(X(i),A(i),dt,M,K,h,c,pr);
    X(i+1)=Nextstate(X(i),A(i),dt,M);
end

end

