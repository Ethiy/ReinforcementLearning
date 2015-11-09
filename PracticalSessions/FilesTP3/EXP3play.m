function [Actions,Rewards]=EXP3play(n,G,eta,beta,Seq)
    Actions=ones(1,n);
    Rewards=zeros(1,n);
    A=EXP3(eta,beta,length(G));
    for t=1:n
        Actions(t)=A.play();
        Rewards(t)=G(Actions(t),Seq(t));
        A.getReward(Rewards(t));
    end
end