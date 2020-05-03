function [RD]=QC_RD_v1(RD)

%add times
[DoY, STx, ET]=file_times(RD.DT');
RD.DoY=DoY';RD.ST=STx';RD.ET=ET'; clear DoY STx ET

%QC flag
RD.flag.SWUP=ones(size(RD.DoY));
RD.flag.SWDN=ones(size(RD.DoY));
RD.flag.IRUP=ones(size(RD.DoY));
RD.flag.IRDN=ones(size(RD.DoY));
RD.flag.IRUPCOR=ones(size(RD.DoY));
RD.flag.IRDNCOR=ones(size(RD.DoY));
RD.flag.BodyT=ones(size(RD.DoY));
RD.flag.Cleaning=ones(size(RD.DoY));

%body temperature error
ix=find((RD.BodyT>80)|(RD.BodyT<-40));
if ~isempty(ix)
    RD.flag.BodyT(ix)=2;
end
clear ix

%cleaning
ix=find( ((RD.IRUPCOR(2:end)-RD.IRUPCOR(1:end-1))>1) & ((RD.DT(2:end,4)>5)&(RD.DT(2:end,4)<8)) ) ;
ix1=find(diff(ix)>10000);
C_ix=[ix(ix1); ix(end)];
L_ix=C_ix-12;
U_ix=C_ix+12;

if ~isempty(C_ix)
    for n=1:length(C_ix)
        RD.flag.Cleaning(L_ix(n):U_ix(n))=2;
    end
end
clear C_ix L_ix U_ix ix ix1

%SW upward facing sensor - downwelling
ix=find(RD.SWUP<0);
if ~isempty(ix)
    RD.flag.SWUP(ix)=2;
end
clear ix

ix=find(RD.SWUP>2000);
if ~isempty(ix)
    RD.flag.SWUP(ix)=3;
end
clear ix

%SW downward facing sensor - upwelling
ix=find(RD.SWDN<0);
if ~isempty(ix)
    RD.flag.SWDN(ix)=2;
end
clear ix

ix=find(RD.SWDN>2000);
if ~isempty(ix)
    RD.flag.SWDN(ix)=3;
end
clear ix

%LW upward facing sensor - downwelling
ix=find(RD.IRUP<0);
if ~isempty(ix)
    RD.flag.IRUP(ix)=2;
end
clear ix

ix=find(RD.IRUP>1000);
if ~isempty(ix)
    RD.flag.IRUP(ix)=3;
end
clear ix

%LW downward facing sensor - upwelling
ix=find(RD.IRDN<0);
if ~isempty(ix)
    RD.flag.IRDN(ix)=2;
end
clear ix

ix=find(RD.IRDN>1000);
if ~isempty(ix)
    RD.flag.IRDN(ix)=3;
end
clear ix

%LW upward facing sensor - downwelling corrected
ix=find(RD.IRUPCOR<0);
if ~isempty(ix)
    RD.flag.IRUPCOR(ix)=2;
end
clear ix

ix=find(RD.IRUPCOR>1000);
if ~isempty(ix)
    RD.flag.IRUPCOR(ix)=3;
end
clear ix

%LW downward facing sensor - upwelling
ix=find(RD.IRDNCOR<0);
if ~isempty(ix)
    RD.flag.IRDNCOR(ix)=2;
end
clear ix

ix=find(RD.IRDNCOR>1000);
if ~isempty(ix)
    RD.flag.IRDNCOR(ix)=3;
end
clear ix
