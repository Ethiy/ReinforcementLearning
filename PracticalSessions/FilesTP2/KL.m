function y=KL(a,b,MAB)
    p1=MAB{a}.p;
    p2=MAB{b}.p;
    y=p1*log(p1/p2)+(1-p1)*log((1-p1)/(1-p2));
end
