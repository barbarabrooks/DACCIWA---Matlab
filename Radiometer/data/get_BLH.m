function [data]=get_BLH(fi)

D=dlmread(fi,',',6,0);
data.DT=D(:,1:6);
data.DT(:,1)=data.DT(:,1)+2000;
data.flag=D(:,7);
data.BLH=D(:,8);%m

