function hxy2=JointEntropy_accumarray(a)

row_snp=size(a,1);

subs = a+1;
sample = accumarray(subs,ones(row_snp,1));
sample(4,4,4,4) = 0;

hxy2=0;
for i = 1:2
    for j = 1:3
        for k=1:3
            for m=1:3
                if  sample(i,j,k,m)~=0
                    temp_freq=sample(i,j,k,m)/row_snp;
                    hxy2 = hxy2 - temp_freq*log2(temp_freq);
                end
            end
        end
    end
end
end