function [q]=Qfunction(R,P,V,gamma,M)
    aux=zeros(M+1,M+1);
    for i=1:M+1
        for j=1:M+1
            for k=1:M+1
                aux(i,j)=aux(i,j)+P(i,k,j)*V(k);
            end
        end
    end
    q=R+gamma.*aux;
end