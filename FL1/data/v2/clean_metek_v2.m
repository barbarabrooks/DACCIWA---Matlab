function metek = clean_metek_v2(metek)
% clean_metek - clean up metek sonic anemometer data
%
% metek = clean_metek(metek)
%
% INPUT
%  metek  - data strucure
%
% OUTPUT
%  metek  - data structure
%
% wind compents and sonic temperature are cleaned up:
% - the time series are filtered for outliers, these are replaced with  
%   median filtered values
% - missing values from error messages (NaNs) are then interpolated over
%
% IMB : 25/7/2014

% filter for clear outliers - replace with median filtered values
% set limit at 3*standard deviation of vertical wind component
jj = ~isnan(metek.z);
sd = std(metek.z(jj));

jj = ~isnan(metek.x);
temp = metek.x(jj);
mf = medfilt1(temp,11);
ii = abs(temp - mf) > 3*sd;
temp(ii) = mf(ii);
metek.x(jj) = temp;

jj = ~isnan(metek.y);
temp = metek.y(jj);
mf = medfilt1(temp,11);
ii = abs(temp - mf) > 3*sd;
temp(ii) = mf(ii);
metek.y(jj) = temp;

jj = ~isnan(metek.z);
temp = metek.z(jj);
mf = medfilt1(temp,11);
ii = abs(temp - mf) > 3*sd;
temp(ii) = mf(ii);
metek.z(jj) = temp;

jj = ~isnan(metek.sontemp);
temp = metek.sontemp(jj);
sd = std(temp);
mf = medfilt1(temp,15);
ii = abs(temp - mf) > 3*sd;
temp(ii) = mf(ii);
metek.sontemp(jj) = temp;

% patch up missing data from records with error messages by interpolation
ii = isnan(metek.x);
metek.x(ii) = interp1(metek.doy(~ii),metek.x(~ii),metek.doy(ii));
metek.y(ii) = interp1(metek.doy(~ii),metek.y(~ii),metek.doy(ii));
metek.z(ii) = interp1(metek.doy(~ii),metek.z(~ii),metek.doy(ii));
metek.sontemp(ii) = interp1(metek.doy(~ii),metek.sontemp(~ii),metek.doy(ii));
