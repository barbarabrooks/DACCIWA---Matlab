function [data]=get_LPR(fi)

data.z=dlmread(fi,',',[7 0 7 91]);        
D=dlmread(fi,',',9,0);
data.DT=D(:,1:6);
data.DT(:,1)=data.DT(:,1)+2000;
[r,c]=size(D);
data.LPR=D(:,8:c);%g/m3
data.flag=D(:,7);