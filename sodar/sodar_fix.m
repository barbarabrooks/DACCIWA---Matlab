load('F:\working\SODAR\sond-sodar.mat')
%interpolate sondes

%interpolate to 10m bins
%[tt,~]=size(sonde.Z);
%z3=(30:10:1000);
%sonde2.Z=ones(tt,length(z3));
%sonde2.WS=ones(tt,length(z3));
%sonde2.WD=ones(tt,length(z3));
%for n=1:tt 
%   z1=sonde.Z(n,:);
%   ws1=sonde.WS(n,:);
%   wd1=sonde.WD(n,:);
%   ix=find(~isnan(z1)==1);
%   if ~isempty(ix)
%        z2=z1(ix);
%        ws2=ws1(ix);
%        wd2=wd1(ix);
%   
%        [p,~]=polyfit(z2,ws2,6); ws3=polyval(p,z3); clear p
%        [p,~]=polyfit(z2,wd2,6); wd3=polyval(p,z3); clear p
%   
%        sonde2.Z(n,:)=z3;
%        sonde2.WS(n,:)=ws3;
%        sonde2.WD(n,:)=wd3;
%   
%        clear z1 z2 ws1 ws2 ws3 wd1 wd2 wd3
%   end
%end
%clear z3 tt

%interpolate on to 10 min time base
[~,~,ET1]=file_times(sonde.DT');

DT(1,:)=[2016,6,11,0,0,0];
DT(2,:)=[2016,7,31,0,0,0];
[~,~,ET]=file_times(DT');
ET3=ET(1):600:ET(2);

[DoY3, ST3, DT3] = unixtime2mat(ET3);

sonde3.DT=DT3;
sonde3.DoY=DoY3';
sonde3.ST=ST3;
sonde3.ET=ET3';
[~,rr]=size(sonde2.Z);
sonde3.Z=ones(length(ET3),rr).*NaN;
sonde3.WS=ones(length(ET3),rr).*NaN;
sonde3.WD=ones(length(ET3),rr).*NaN;

for n=1:rr
    z1=sonde2.Z(:,n);
    ix=find(~isnan(z1)==1);
    z2=z1(ix);ET2=ET1(ix);
    if ~isempty(ix)
        z3=interp1(ET2,z2,ET3,'spline');
        sonde3.Z(:,n)=z3;
    end
    clear ix z1 z2 z3 ET2
    
    ws1=sonde2.WS(:,n);
    ix=find(~isnan(ws1)==1);
    ws2=ws1(ix);ET2=ET1(ix);
    if ~isempty(ix)
        ws3=interp1(ET2,ws2,ET3,'spline');
        sonde3.WS(:,n)=ws3;
    end
    clear ix ws1 ws2 ws3 ET2
    
    wd1=sonde2.WD(:,n);
    ix=find(~isnan(wd1)==1);
    wd2=wd1(ix);ET2=ET1(ix);
    if ~isempty(ix)
        wd3=interp1(ET2,wd2,ET3,'spline');
        sonde3.WD(:,n)=wd3;
    end
    clear ix wd1 wd2 wd3 ET2
end
clear DT ET DoY3 ST3 DT3 ET1 ET3 rr

%ix=find(sonde3.WS>40);
%if ~isempty(ix)
%    sonde3.WS(ix)=sonde3.WS(ix).*NaN;
%    sonde3.WD(ix)=sonde3.WD(ix).*NaN;
%end
%clear ix
%ix=find(sonde3.WS<0);
%if ~isempty(ix)
%    sonde3.WS(ix)=sonde3.WS(ix).*NaN;
%    sonde3.WD(ix)=sonde3.WD(ix).*NaN;
%end
%clear ix
%ix=find(sonde3.WS==0);
%if ~isempty(ix)
%    sonde3.WD(ix)=sonde3.WD(ix).*NaN;
%end
%clear ix
%ix=find(sonde3.WD<0);
%if ~isempty(ix)
%    sonde3.WS(ix)=sonde3.WS(ix).*NaN;
%    sonde3.WD(ix)=sonde3.WD(ix).*NaN;
%end
%clear ix
%ix=find(sonde3.WD>360);
%if ~isempty(ix)
%    sonde3.WS(ix)=sonde3.WS(ix).*NaN;
%    sonde3.WD(ix)=sonde3.WD(ix).*NaN;
%end
%clear ix
[sonde3.U,sonde3.V]=uandv(sonde3.WS,sonde3.WD);


