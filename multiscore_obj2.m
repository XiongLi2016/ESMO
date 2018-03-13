function [score1,score2] = multiscore_obj2(snp_pos,snp_com,state,My_factorial)
[xrow,~] = size(snp_com);

A=[state, snp_com];
[score1,sample3]=MutualInfo_improved(A);
score1=1/score1;
subs = snp_com+1;
sample=sample3;
disease = accumarray(subs,state);
control = sample-disease;
sample(4,4,4) = 0;
disease(4,4,4) = 0;
control(4,4,4) = 0;

z=0;
for i = 1:3
    for j = 1:3
        for k=1:3
        y=My_factorial(sample(i,j,k)+1);
        if disease(i,j,k)==0
            disease_index=1;
        else
            disease_index=disease(i,j,k);
        end
        if control(i,j,k)==0
            control_index=1;
        else 
            control_index=control(i,j,k);
        end
        r=My_factorial(disease_index)+My_factorial(control_index);
        z=z+(r-y);
        end
    end
end
score2=abs(z);


