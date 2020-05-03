function licor = clean_licor_v2(licor)
% clean_metek - clean up metek sonic anemometer data
%
% metek = clean_metek(metek)
%
% INPUT
%  licor  - data strucure
%
% OUTPUT
%  licor  - data structure
%
% temperature, pressure, and gas conc  are cleaned up:
% - the time series are filtered for outliers, these are replaced with  
%   median filtered values
% - missing values from error messages (NaNs) are then interpolated over
%
% BJB : 08/12/2016

% filter for clear outliers - replace with median filtered values
% set limit at 3*standard deviation of 
%temperature
jj = ~isnan(licor.T);
sd = std(licor.T(jj));
temp = licor.T(jj);
mf = medfilt1(temp,11);
ii = abs(temp - mf) > 3*sd;
temp(ii) = mf(ii);
licor.T(jj) = temp;

%pressure
jj = ~isnan(licor.PP);
sd = std(licor.PP(jj));
temp = licor.PP(jj);
mf = medfilt1(temp,11);
ii = abs(temp - mf) > 3*sd;
temp(ii) = mf(ii);
licor.PP(jj) = temp;

%CO2 1
jj = ~isnan(licor.CO2(:,1));
sd = std(licor.CO2(jj,1));
temp = licor.CO2(jj,1);
mf = medfilt1(temp,11);
ii = abs(temp - mf) > 3*sd;
temp(ii) = mf(ii);
licor.CO2(jj,1) = temp;

%CO2 2
jj = ~isnan(licor.CO2(:,2));
sd = std(licor.CO2(jj,2));
temp = licor.CO2(jj,2);
mf = medfilt1(temp,11);
ii = abs(temp - mf) > 3*sd;
temp(ii) = mf(ii);
licor.CO2(jj,2) = temp;

%H2O 1
jj = ~isnan(licor.H2O(:,1));
sd = std(licor.H2O(jj,1));
temp = licor.H2O(jj,1);
mf = medfilt1(temp,11);
ii = abs(temp - mf) > 3*sd;
temp(ii) = mf(ii);
licor.H2O(jj,1) = temp;

%H2O 2
jj = ~isnan(licor.H2O(:,2));
sd = std(licor.H2O(jj,2));
temp = licor.H2O(jj,2);
mf = medfilt1(temp,11);
ii = abs(temp - mf) > 3*sd;
temp(ii) = mf(ii);
licor.H2O(jj,2) = temp;

% patch up missing data from records with error messages by interpolation
ii = isnan(licor.CO2(:,1));
licor.T(ii) = interp1(licor.doy(~ii),licor.T(~ii),licor.doy(ii));
licor.PP(ii) = interp1(licor.doy(~ii),licor.PP(~ii),licor.doy(ii));
licor.CO2(ii,1) = interp1(licor.doy(~ii),licor.CO2(~ii,1),licor.doy(ii));
licor.CO2(ii,2) = interp1(licor.doy(~ii),licor.CO2(~ii,2),licor.doy(ii));
licor.H2O(ii,1) = interp1(licor.doy(~ii),licor.H2O(~ii,1),licor.doy(ii));
licor.H2O(ii,2) = interp1(licor.doy(~ii),licor.H2O(~ii,2),licor.doy(ii));