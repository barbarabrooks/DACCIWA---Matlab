function [d]=QC_Sonde_EDT_MW41_v2(d)
%replace missing values with -1e20
%Pressure
ix=find(d.PP==99999);
if ~isempty(ix)
    d.PP(ix)=NaN;
end
clear ix

%temperature
ix=find(d.TT==99999);
if ~isempty(ix)
    d.TT(ix)=NaN;
end
clear ix

%RH
ix=find(d.RH==99999);
if ~isempty(ix)
    d.RH(ix)=NaN;
end
clear ix

%lat
ix=find(d.LAT==99999);
if ~isempty(ix)
    d.LAT(ix)=NaN;
end
clear ix

%long
ix=find(d.LON==99999);
if ~isempty(ix)
    d.LON(ix)=NaN;
end
clear ix

%WS
ix=find(d.WS==99999);
if ~isempty(ix)
    d.WS(ix)=NaN;
end
clear ix

%WD
ix=find(d.WD==99999);
if ~isempty(ix)
    d.WD(ix)=NaN;
end
clear ix

%ascent rate
ix=find(d.AcRate==99999);
if ~isempty(ix)
    d.AcRate(ix)=NaN;
end
clear ix

%altitude
ix=find(d.ZZ==99999);
if ~isempty(ix)
    d.ZZ(ix)=NaN;
end
clear ix

d.flag=ones(size(d.EP));
% flags 2= zero measure ascent rate 3=zero wind speed
ix=find(d.AcRate==0);
if ~isempty(ix)
    if length(ix)>1
        d.flag(ix(2:end))=2;
    end
end
clear ix

ix=find(d.WS==0);
if ~isempty(ix)
    if length(ix)>1
        d.flag(ix(2:end))=3;
    end
end
clear ix

