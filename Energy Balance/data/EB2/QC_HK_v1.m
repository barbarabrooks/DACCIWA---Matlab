function [HK]=QC_HK_v1(HK)

%add times
[DoY, STx, ET]=file_times(HK.DT');
HK.DoY=DoY';HK.ST=STx';HK.ET=ET'; clear DoY STx ET

%QC flag
HK.flag=ones(size(HK.DoY));

%logger temperature outside operational bounds
ix=find((HK.loggerT>50)|(HK.loggerT<-25));
if ~isempty(ix)
    HK.flag(ix)=2;
end
clear ix

ix=find((HK.loggerSupplyVolts>16)|(HK.loggerSupplyVolts<11));
if ~isempty(ix)
    HK.flag(ix)=3;
end
clear ix
