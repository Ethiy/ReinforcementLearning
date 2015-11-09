function [ActionsA,ActionsB,Rew]= EXP3vEXP3(n,eta,beta,G)
    ActionsA=ones(1,n);
    ActionsB=ones(1,n);
    Rew=zeros(1,n);
    A=EXP3(eta,beta,length(G));
    B=EXP3(eta,beta,length(G));
    for t=1:n
        ActionsA(t)=A.play();
        ActionsB(t)=A.play();
        Rew(t)=G(ActionsA(t),ActionsB(t));
        A.getReward(Rew(t));
        B.getReward(Rew(t));
    end
end