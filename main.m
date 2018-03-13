%% MACOED.m  multi-objective ant colony optimization in  problem.
warning('off');
clc;clear;
samplesize = 1600;
Bp = 0.1;
dim_epi = 3;
dim = 100;
comb = nchoosek(dim,dim_epi);
pvalue = Bp/comb;
datasetmodel='0.2-0.2-0.2_EDM-1';
tempFoldname=strcat(datasetmodel,'Transformed98-99-100');
fileFolder=fullfile(tempFoldname);
dirOutput=dir(fullfile(fileFolder,'*.txt'));
fileNames={dirOutput.name}';
if size(fileNames,1)==0
    fprintf('no file \n ');
    return;
end
data_num = size(fileNames,1)
root=strcat(tempFoldname,'\');
AllEpistatic=[];
tic
ac = 0;
ac_inter = 0;
ac_inter2 = 0;
ac_inter3 = 0;
MeanSize=0;
functionSNP=[98 99 100];%H1
functionSNP2=[95 96 97];%H2
functionSNP3=[92 93 94];%H3
global My_factorial;
My_factorial=FactorialFun(800);%Trading space for time
for d = 0:data_num-1
    %%%%%%%%%%%%%%modified
    filename=strcat(root, fileNames{d+1})
    a = dlmread(filename,',',0,0);
    data = a(:,[1:dim end]);
    [row col]=size(data)
    filter_snps = exhausive_search2(data,dim_epi)
    MeanSize=MeanSize+size(filter_snps,2);
    if all(ismember(functionSNP,filter_snps))
        ac_inter = ac_inter+1;
    end
    if all(ismember(functionSNP2,filter_snps))
        ac_inter2 = ac_inter2+1;
    end
     if all(ismember(functionSNP3,filter_snps))
        ac_inter3 = ac_inter3+1;
    end
    ac_inter
    ac_inter2
    ac_inter3
    % step 2 : clean step
    filter_snps(filter_snps==0)=[];
    [epistatic,TP,TN,FP,FN] = Chisuqare_test_sta(data,filter_snps,dim_epi,pvalue,functionSNP);
   
end
time = toc;
MeanSize=MeanSize/data_num;
%%%%%%%%%%%%%%%%%modified
datafolder='';
PowerName='Power';
dataFile=strcat(datafolder,PowerName);
dataFile=strcat(dataFile,datasetmodel);
dataFile=strcat(dataFile,'.txt');
fid=fopen(dataFile, 'wt');  
fprintf(fid,'MeanSize=%6.2f \t ac_inter=%6.2f  \t ac_inter2=%6.2f  \t time=%6.2f \t \n',MeanSize,ac_inter,ac_inter2,time);  % 将文件a中的数据写入文件c
fclose(fid);
%%%%%%%%%%%%%%%%%%%%%%%%%%
