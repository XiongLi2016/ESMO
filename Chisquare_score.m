function score = Chisquare_score(snp_com,state)
[xrow,~] = size(snp_com);
subs = snp_com+1;
sample = accumarray(subs,ones(xrow,1));
disease = accumarray(subs,state);
control = sample-disease;
sample(4,4) = 0;
disease(4,4) = 0;
control(4,4) = 0;
t_s = sum(sum(sample(1:3,1:3)));
t_d = sum(sum(disease(1:3,1:3)));
z=0;
ed = zeros(3,3);
ec = zeros(3,3);
for i = 1:3
    for j = 1:3
        ed(i,j) = sample(i,j)*t_d/t_s;
        ec(i,j) = sample(i,j)-ed(i,j);
        if ed(i,j)~=0
            z = z+(disease(i,j)-ed(i,j))^2/ed(i,j);
        end
        if ec(i,j)~=0
            z = z+(control(i,j)-ec(i,j))^2/ec(i,j);
        end
    end
end
score = z;
        
        
        
        
        
        
