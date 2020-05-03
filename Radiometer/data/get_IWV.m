function [data]=get_IWV(fi)

D=dlmread(fi,',',7,0);
data.DT=D(:,1:6);
data.DT(:,1)=data.DT(:,1)+2000;
data.flag=D(:,7);
data.IWV=D(:,8);%Kg/m2
data.ELV=D(:,9);%deg
data.AZI=D(:,10);%deg