function [s,l]=clean_sonic_and_licor_v2 (sonic,licor)

%sonic
metek.x=sonic.xyz(:,1);
metek.y=sonic.xyz(:,2);
metek.z=sonic.xyz(:,3);
metek.sontemp=sonic.T;
[DoY,~,~]=file_times(sonic.DT');metek.doy=DoY';clear DoY
    
metek = clean_metek_v2(metek);
s=sonic;
s.xyz(:,1)=metek.x;
s.xyz(:,2)=metek.y;
s.xyz(:,3)=metek.z;
s.Ts(:,1)=metek.sontemp;

[DoY,~,~]=file_times(licor.DT');licor.doy=DoY';clear DoY
l=licor;
ix=find(l.H2O<0);
if ~isempty(ix)
    l.H2O(ix)=l.H2O(ix).*NaN;
end
clear ix

ix=find(l.CO2<0);
if ~isempty(ix)
    l.CO2(ix)=l.CO2(ix).*NaN;
end
clear ix

ix=find(l.T<0);
if ~isempty(ix)
    l.T(ix)=l.T(ix).*NaN;
end
clear ix

ix=find(l.PP<0);
if ~isempty(ix)
    l.PP(ix)=l.PP(ix).*NaN;
end
clear ix

licor = clean_licor_v2(licor);
l.T=licor.T;
l.PP=licor.PP;
l.CO2=licor.CO2;
l.H2O=licor.H2O;


  
