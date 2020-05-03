function [LL]=get_Line_v1(junk2)

LL=ones(1,31).*NaN;
temp=str2num(junk2(4:end));
LL(1:length(temp))=temp;
