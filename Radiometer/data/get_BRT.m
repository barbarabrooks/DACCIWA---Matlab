function [data]=get_BRT(fi)

D=dlmread(fi,',',9,0);
data.DT=D(:,1:6);
data.DT(:,1)=data.DT(:,1)+2000;
[r,c]=size(D);
data.AZI=D(:,c);
data.ELV=D(:,c-1);
data.BRT=D(:,8:c-2);%:
data.flag=D(:,7);
