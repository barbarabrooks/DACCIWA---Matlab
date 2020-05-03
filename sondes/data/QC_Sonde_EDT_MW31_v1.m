function [d]=QC_Sonde_EDT_MW31_v1(dd)
%Sonde Serial number
ix=findstr(dd.sn,' ');
d.SN=dd.sn(ix(end)+1:end);
d.date=dd.date;
d.time=dd.time;

% sort time
DT(1)=str2num(dd.date(1:4));
DT(2)=str2num(dd.date(5:6));
DT(3)=str2num(dd.date(7:8));
DT(4)=str2num(dd.time(1:2));
DT(5)=str2num(dd.time(3:4));
DT(6)=str2num(dd.time(5:6));
[junk, ST, junk]=file_times(DT');clear junk

DT1=DT; DT1(6)=0; 
DT2=DT1; DT2(6)=1;
[junk, ST1,junk]=file_times(DT1');clear junk
[junk, ST2,junk]=file_times(DT2');clear junk

US=ST2-ST1;
temp=ST+((dd.EP).*US);
%elapsed time
d.Elapsed_Time=dd.EP;

clear DT ST DT1 DT2 ST1 ST2 US 
d.DT=datevec(temp);
d.DT(:,6)=round(d.DT(:,6));
ix=find(d.DT(:,6)==60);
if ~isempty(ix)
    d.DT(ix,6)=0;
    d.DT(ix,5)=d.DT(ix,5)+1;
end
clear ix
ix=find(d.DT(:,5)==60);
if ~isempty(ix)
    d.DT(ix,5)=0;
    d.DT(ix,4)=d.DT(ix,4)+1;
end
clear ix
[DoY, ST, ET]=file_times(d.DT');
d.DoY=DoY'; d.ET=ET'; clear DoY ST ET temp

%replace missing values with -1e20
%Pressure
d.PP=dd.PP;
ix=find(d.PP==99999);
if ~isempty(ix)
    d.PP(ix)=-1e20;
end
clear ix

%temperature
d.TT=dd.T;
ix=find(d.TT==99999);
if ~isempty(ix)
    d.TT(ix)=-1e20;
end
clear ix

%RH
d.RH=dd.RH;
ix=find(d.RH==99999);
if ~isempty(ix)
    d.RH(ix)=-1e20;
end
clear ix

%lat
d.LAT=dd.LAT;
ix=find(d.LAT==-32768);
if ~isempty(ix)
    d.LAT(ix)=-1e20;
end
clear ix

%long
d.LON=dd.LON;
ix=find(d.LON==-32768);
if ~isempty(ix)
    d.LON(ix)=-1e20;
end
clear ix

%WS
d.WS=dd.WS;
ix=find(d.WS==-32768);
if ~isempty(ix)
    d.WS(ix)=-1e20;
end
clear ix

%WD
d.WD=dd.WD;
ix=find(d.WD==-32768);
if ~isempty(ix)
    d.WD(ix)=-1e20;
end
clear ix

%ascent rate
d.AcRate=dd.AcRate;
ix=find(d.AcRate==99999);
if ~isempty(ix)
    d.AcRate(ix)=-1e20;
end
clear ix

%altitude
d.Altitude=dd.Z;
ix=find(d.Altitude==99999);
if ~isempty(ix)
    d.Altitude(ix)=-1e20;
end
clear ix

% flags 2= zero measure ascent rate 3=zero wind speed

d.flag=ones(size(d.Elapsed_Time));
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

