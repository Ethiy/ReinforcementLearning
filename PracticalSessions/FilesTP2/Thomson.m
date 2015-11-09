function [rew,draws]=Thomson(T,MAB)
    rew=zeros(1,T);
    draws=zeros(1,T);
    Arms=length(MAB);
    S=zeros(1,Arms);
    N=ones(1,Arms);
    theta=zeros(1,Arms);
    for t=1:T
        for a=1:Arms
            theta(a)=betarnd(S(a)+1,N(a)-S(a)+1);
        end
        [aux,A]=max(theta);
        draws(t)=A;
        rew(t)=MAB{A}.play();
        %Update
        S(A)=S(A)+rew(t);
        N(A)=N(A)+1;
        
    end
end