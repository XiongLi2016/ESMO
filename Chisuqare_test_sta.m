function [epistatic,TP,TN,FP,FN] = Chisuqare_test_sta(data,filter_snps,epi_dim,pvalue,FunctionSNP)
state = data(:,end);
degree = 3^epi_dim-1;
combination = combntns(1:size(filter_snps,2),epi_dim);
epistatic = [];
m = 1;
for k = 1:size(combination,1)
    snp_com = data(:,filter_snps(:,combination(k,:)));
    score = Chisquare_score(snp_com,state);
    p = 1-chi2cdf(score,degree);
    if(p <= pvalue)
        epistatic(m,1:epi_dim) = filter_snps(1,combination(k,:));    
        epistatic(m,epi_dim+1) = p;
        m = m+1;
    end
    TP=0;TN=0;FP=0;FN=0;
    comNum=size(combination,1);
    if isempty(epistatic)
        TN=comNum;
        return;
    end
    for j=1:size(epistatic,1)
        if(isequal(FunctionSNP,epistatic(j,1:epi_dim)))
            TP=TP+1;
        end
    end
    if(TP==0&&all(ismember(FunctionSNP,filter_snps)))
        FN=FN+1;
    end
   FP=size(epistatic,1)-TP;
   TN=comNum-FP;
end
    
    

