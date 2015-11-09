function [rew,draws]=UCB(T,alpha,MAB)
    rew=zeros(1,T);
    draws=zeros(1,T);
    Arms=length(MAB);
    S=zeros(1,Arms);
    N=ones(1,Arms);
    B=zeros(1,Arms);
    for t=1:Arms
        draws(t)=t;
        rew(t)=MAB{t}.play();
        S(t)=S(t)+rew(t);
        B(t)=S(t)+sqrt(alpha*log(Arms));
    end
    for t=(Arms+1):T
        [aux,A]=max(B);
        draws(t)=A;
        rew(t)=MAB{A}.play();
        %Update
        S(A)=S(A)+rew(A);
        N(A)=N(A)+1;
        
        B=S./N+sqrt(alpha*log(t)./N);
    end
end