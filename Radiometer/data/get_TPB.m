function [data]=get_TPB(fi)

data.z=dlmread(fi,',',[7 0 7 92]);        
D=dlmread(fi,',',9,0);
data.DT=D(:,1:6);
data.DT(:,1)=data.DT(:,1)+2000;
[r,c]=size(D);
data.T=D(:,8:c);%K
data.flag=D(:,7);