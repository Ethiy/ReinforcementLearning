function [V]=pol_eval(pol,P,R,M,gamma)
    
    Rpol=zeros(M+1,1);
    for i=1:M+1
        Rpol(i)=R(i,pol(i));
    end
    %Rpol is the reward we obtain with the policy pol
    

    Ppol=zeros(M+1,M+1);
    for j1=1:M+1
        for j2=1:M+1
            Ppol(j1,j2)=P(j1,j2,pol(j1));
        end
    end
    %Ppol is the transition matrix with the policy pol
    
    V=(ones(M+1,M+1)-gamma.*Ppol)^-1*Rpol;
end