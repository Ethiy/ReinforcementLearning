function [X,R] = trajectory(n,x0,pi,D,M,K,h,c,pr)
% genere a trajectory X of length  n in the MDP 
% X sequence of states
% R sequence of associated rewards  
% x0 initial state
% pi policy
R=zeros(1,n-1);
X=zeros(1,n);
X(1)=x0;
for i=1:n-1
    dt=simu(D);
    R(i)=Reward(X(i),pi(X(i)+1),dt,M,K,h,c,pr);
    X(i+1)=Nextstate(X(i),pi(X(i)+1),dt,M);
end

end

