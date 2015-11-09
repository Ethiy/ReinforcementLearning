function [P,R]=MDP(D,M,K,h,c,pr)
% renvoie le mod�le de transitions P et de r�compense R du MDP
% D vecteur de proba 
% M,h,c,K param�tres du MDP

P=zeros(M+1,M+1,M+1);
R=zeros(M+1,M+1);

for a=0:M % indexer boucle par indice r�el !
    for x=0:M
        for d=0:M % boucle sur les valeurs de D (une possibilit�)
            P(1+x,1+Nextstate(x,a,d,M),a+1)=P(1+x,1+Nextstate(x,a,d,M),1+a)+D(1+d);
            R(1+x,1+a)= R(1+x,1+a) + D(1+d)*Reward(x,a,d,M,K,h,c,pr);
        end
    end
end

    
    