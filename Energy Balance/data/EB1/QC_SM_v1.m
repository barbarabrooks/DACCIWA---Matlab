function [SM]=QC_SM_v1(SM)

%add times
[DoY, STx, ET]=file_times(SM.DT');
SM.DoY=DoY';SM.ST=STx';SM.ET=ET'; clear DoY STx ET

%QC flag
SM.flag.SM1=ones(size(SM.DoY));
SM.flag.SM2=ones(size(SM.DoY));
SM.flag.SM3=ones(size(SM.DoY));

ix=find(SM.SM_kPA1>80);
if ~isempty(ix)
    SM.flag.SM1(ix)=2;
end
clear ix

ix=find(SM.SM_kPA2>80);
if ~isempty(ix)
    SM.flag.SM2(ix)=2;
end
clear ix

ix=find(SM.SM_kPA3>80);
if ~isempty(ix)
    SM.flag.SM3(ix)=2;
end
clear ix