function  [Actions,Rewards]=maxA(n,G,Seq)
    Actions=ones(1,n);
    Rewards=zeros(1,n);
    for t=1:n
        [Rewards(t),Actions(t)]=max(G(:,Seq(t)));
    end
end