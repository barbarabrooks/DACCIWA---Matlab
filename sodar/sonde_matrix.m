d1='F:\WORKING\Sondes\matlab';

%get sonde data
list1=dir(d1);

sonde.DT=ones(length(list1)-2,6);
sonde.Z=ones(length(list1)-2,200).*NaN;
sonde.WS=ones(length(list1)-2,200).*NaN;
sonde.WD=ones(length(list1)-2,200).*NaN;
sonde.U=ones(length(list1)-2,200).*NaN;
sonde.V=ones(length(list1)-2,200).*NaN;

for n=3:length(list1)
    load(fullfile(d1,list1(n).name));
    sonde.DT(n-2,:)=data.DT(1,:);
    ws=data.WS;wd=data.WD;z=data.Altitude;z=data.Altitude;
    %start height at Zero
    zz=z-z(1);clear z
    
    ix1=find(zz>=30);
    ix2=find(zz>=1000);
    z=zz(ix1(1):ix2(1));ws=ws(ix1(1):ix2(1));wd=wd(ix1(1):ix2(1));[u,v]=uandv(ws,wd);
    sonde.Z(n-2,1:length(z))=z;
    sonde.WS(n-2,1:length(ws))=ws;
    sonde.WD(n-2,1:length(wd))=wd;
    sonde.U(n-2,1:length(u))=u;
    sonde.V(n-2,1:length(v))=v;
    
    clear data z ws wd u v ix1 ix2
end

%interpolate to 10m bins
[tt,~]=size(sonde.Z);
z3=(30:10:1000);
sonde2.Z=ones(tt,length(z3));
sonde2.WS=ones(tt,length(z3));
sonde2.WD=ones(tt,length(z3));
for n=1:tt 
   z1=sonde.Z(n,:);
   ws1=sonde.WS(n,:);
   wd1=sonde.WD(n,:);
   ix=find(~isnan(z1)==1);
   if ~isempty(ix)
        z2=z1(ix);
        [z22,ia,~]=unique(z2);
        
        ws2=ws1(ix);
        ws3=interp1(z22,ws2(ia),z3,'spline');
       
        wd2=wd1(ix);
        wd3=interp1(z22,wd2(ia),z3,'spline');
   
        sonde2.Z(n,:)=z3;
        sonde2.WS(n,:)=ws3;
        sonde2.WD(n,:)=wd3;
   
        clear z1 z2 z22 ia ws1 ws2 ws3 wd1 wd2 wd3
   end
end
clear z3 tt

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

[sonde3.U,sonde3.V]=uandv(sonde3.WS,sonde3.WD);