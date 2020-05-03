function [data]=get_MET(fi)

D=dlmread(fi,',',11,0);
data.DT=D(:,1:6);
data.DT(:,1)=data.DT(:,1)+2000;
data.flag=D(:,7);
data.PP=D(:,8);%mbar
data.T=D(:,9);%K
data.RH=D(:,10);%RH
