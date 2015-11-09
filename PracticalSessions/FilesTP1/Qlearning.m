function [q]=Qlearning(M,gamma,X,A,R)

T=size(A)-1;
q=zeros(M+1,M+1);

for t=1:T(2)
    q(X(t)+1,A(t))=q(X(t)+1,A(t))+1/t*(R(t)+gamma*max(q(X(t+1)+1,A(t)))-q(X(t)+1,A(t)));
end

end