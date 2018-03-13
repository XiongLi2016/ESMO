function global_subsets = exhausive_search2(data,dim_epi)
n=size(data,2);
state=data(:,n);
n=n-1;

candidate1=1;
candidate2=2;
candidate3=3;
all_score=zeros(n,2)+100000;
all_pos=zeros(n,dim_epi);
global My_factorial;

parfor i=1:n
score1=100000;
score2=100000;
    for j=i+1:n%%%%%%
        for k=j+1:n%%%%%%%%%
                snp_com=data(:,[i j k]);
                [temp_score1,temp_score2]=multiscore_obj2([i j k],snp_com,state,My_factorial);
                if temp_score1<score1
                    if temp_score2<score2
                           score1= temp_score1;
                           score2= temp_score2;
                           all_score(i,:)=[score1 score2];
                           all_pos(i,:)=[i j k];
                        end
                    end

            end
    end
end
bestsolutions=non_domiant_top_k(all_score,all_pos);
global_subsets=bestsolutions;
end