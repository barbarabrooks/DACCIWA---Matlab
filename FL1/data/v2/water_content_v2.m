function [water]=water_content_v2(sonic,licor)
R=8.314; % universal gas constant J mol-1 K-1
mw=18.02; %molecular weight of water (g) 
md=28.97; %molecular weight dry air (g)
MW=0.01802; %kg mol-1
MD=0.02897; %kg mol-1
Rd=R/MD;   % gas constant for dry air J K-1 kg-1
Rw=R/MW;   % gas constant for water vapour J K-1 kg-1

%water vapour number density (m mol m-3)
water.W=licor.H2O(:,1);

%mass density (g m-3)
water.Wm=(18./1000).*water.W;

%mass density (kg m-3)
water.Wm=water.Wm./1000;

%assuming unit volume mass of water vapour (kg)
water.Mw=water.Wm;

%mass density of dry air (kg m-3) PP in file in kPa T in file in C
water.Wd=((licor.PP).*1000)./(Rd.*(licor.T+273.15));

%assuming unit volume mass of dry air (kg)
water.Md=water.Wd;

%mass mixing ratio
water.Mmr_licor=water.Mw./water.Md;

%specific humidity (kg/kg)
water.Q=water.Mw./(water.Mw+water.Md);

%correct sonic temperature for water (K)
water.Ts=(sonic.Ts+273.15)./(1+(0.51.*water.Q));

%wet air partial pressure (Pa)
water.PPwet=water.Wm.*water.Ts.*Rw;

%dry air partial pressure (Pa)
water.PPdry=((licor.PP).*1000)-water.PPwet;

%mass mixing ratio
water.Mmr_sonic=(water.W./1000).*(mw/md).*R.*(1./water.PPdry).*water.Ts;

