function C=complexity(MAB)
    Arms=length(MAB);
    theta=zeros(1,Arms);
    for i=1:Arms
        theta(i)=MAB{i}.p;
    end
    [aux,opt]=max(theta);
    C=0;
    for i=1:Arms
        if i~=opt
            C=C+KL(i,opt,MAB);
        end
    end
end