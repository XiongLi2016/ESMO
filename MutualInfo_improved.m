function [ixy2,sample3]=MutualInfo_improved(a)
FixedEntropyofLabel=1.0 ;
rows=size(a,1);
hxy_father=JointEntropy_accumarray(a);
subset=a(:,2:end);
[hxy_sub2,sample3]=JointEntropy_3loci_accumarray(subset);
ixy2=FixedEntropyofLabel+hxy_sub2-hxy_father;
