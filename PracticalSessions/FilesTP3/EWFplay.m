function [Actions,Rewards]=EWFplay(n,G,eta,Seq)
    Actions=ones(1,n);
    Rewards=zeros(1,n);
    A=EWF(eta,length(G));
    for t=1:n
        Actions(t)=A.play();
        Rewards(t)=G(Actions(t),Seq(t));
        A.getReward(G(Actions(t),:));
    end
end