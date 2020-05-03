function [ST]=QC_ST_v1(ST)

%add times
[DoY, STx, ET]=file_times(ST.DT');
ST.DoY=DoY';ST.ST=STx';ST.ET=ET'; clear DoY STx ET

%QC flag
ST.flag.ST1=ones(size(ST.DoY));
ST.flag.ST2=ones(size(ST.DoY));
ST.flag.ST3=ones(size(ST.DoY));

ix=find((ST.T1>80)|(ST.T1<-35));
if ~isempty(ix)
    ST.flag.ST1(ix)=2;
end
clear ix

ix=find((ST.T2>80)|(ST.T2<-35));
if ~isempty(ix)
    ST.flag.ST2(ix)=2;
end
clear ix

ix=find((ST.T3>80)|(ST.T3<-35));
if ~isempty(ix)
    ST.flag.ST3(ix)=2;
end
clear ix