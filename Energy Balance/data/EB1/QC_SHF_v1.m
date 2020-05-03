function [SHF]=QC_SHF_v1(SHF)

%add times
[DoY, STx, ET]=file_times(SHF.DT');
SHF.DoY=DoY';SHF.ST=STx';SHF.ET=ET'; clear DoY STx ET

%QC flag
SHF.flag.SHF1=ones(size(SHF.DoY));
SHF.flag.SHF2=ones(size(SHF.DoY));
SHF.flag.SHF3=ones(size(SHF.DoY));