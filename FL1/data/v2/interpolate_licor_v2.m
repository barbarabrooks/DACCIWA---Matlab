function [data]=interpolate_licor_v2(sonic,licor)

[sonic_doy,~,~]=file_times(sonic.DT');
[licor_doy,~,~]=file_times(licor.DT');
    
data.DT=sonic.DT;
data.T(:,1)=interp1(licor_doy,licor.T,sonic_doy);
data.PP(:,1)=interp1(licor_doy,licor.PP,sonic_doy);
data.CO2(:,1)=interp1(licor_doy,licor.CO2(:,1),sonic_doy);
data.CO2(:,2)=interp1(licor_doy,licor.CO2(:,2),sonic_doy);
data.H2O(:,1)=interp1(licor_doy,licor.H2O(:,1),sonic_doy);
data.H2O(:,2)=interp1(licor_doy,licor.H2O(:,2),sonic_doy);


    