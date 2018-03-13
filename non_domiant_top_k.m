function bestsolutions=non_domiant_top_k(all_score,all_pos)
k=3;
index=1;
bestsolutions=zeros(k,3);
while(index<=k)
    [Y,U]=min(all_score);
    if U(1)==U(2)
        bestsolutions(index,:)=all_pos(U(1),:);
        all_pos(U(1),:)=[];
        all_score(U(1),:)=[];
        index=index+1;
    else
        bestsolutions(index,:)=all_pos(U(1),:);
        all_pos(U(1),:)=[];
        all_score(U(1),:)=[];
        index=index+1;
        bestsolutions(index,:)=all_pos(U(2),:);
        all_pos(U(2),:)=[];
        all_score(U(2),:)=[];
        index=index+1;
    end
end
bestsolutions=bestsolutions(1:k,:);
end