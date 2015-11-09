function [V,pol]=VI(P,R,gamma,V0,nb_it,M)
V=V0;
for t=1:nb_it
    Qt=Qfunction(R,P,V,gamma,M);
    [V,pol]=max(Qt,[],2);
end
end
