function [V,pol]=PI(P,R,gamma,pi0,nb_it,M)
    pol=pi0;
    V=pol_eval(pol,P,R,M,gamma);
    for t=1:nb_it
        Qt=Qfunction(R,P,V,gamma,M);
        [V,pol]=max(Qt,[],2);
    end
end