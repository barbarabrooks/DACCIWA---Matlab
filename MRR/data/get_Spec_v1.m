function [F,index]=get_Spec_v1(junk2)

F=ones(1,31).*NaN;
index=str2num(junk2(2:3));
temp=str2num(junk2(4:end));
F(1:length(temp))=temp;
