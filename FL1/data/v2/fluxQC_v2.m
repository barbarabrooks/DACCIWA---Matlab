function [QC,flags] = fluxQC_v2(u,v,w,Ts,sf,Z,D)
% fluxQC - run quality control tests on basic turbulence data
%
% [QC,flags] = fluxQC(u,v,w,Ts,sf,Z,D)
%
% INPUTS
%  u,v,w - turbulent velocity time series in streamline oriented reference 
%          frame (output of rotate_to_run.m) (m/s)
%  Ts    - sonic temperature (K)
%  sf    - sample frequency (Hz)
%  Z     - measurement altitude (m)
%  D     - surface displacement (m) (defaults to zero if omitted)
%                            
%
% OUTPUTS
%  QC    - structure of data quality & scale paramters with fields:
%   .skew_u,v,w,Ts      - skewness of turbulent variable
%   .kurtosis_u,v,w,Ts  - Kurtosis of turbulent variable
%   .sst_wu,wv,wt       - steady state test result
%   .ustar              - friction velocity
%   .L                  - Obukhov length
%   .ZoverL             - stability parameter
%   .sigma_w            - std of vertical velocity
%   .itc_w              - integral turb charecteristic of vert velocity
%
%  flags - structure of data quality flags, with fields:
%   .skew_u,v,w,Ts      - 0 = BAD, 1 = GOOD, 2 = OK
%   .kurtosis_u,v,w,Ts  - 0 = BAD, 1 = GOOD, 2 = OK
%   .sstclass_wu,wv,wt  - steady state class 1-9
%   .itc_class - vert velocity intgral turbulence characteristic class 1-9
%   .quality_wu,wv,wt   - overal turbulence quality (sstclass & itc_class combined)
%                0 = BAD, 1 = GOOD, 2 = OK, 3 = highly suspect
%                (1 is good for basic research, 2 for general use, 3 needs
%                 further sanity checking, but might be OK for general use)
%
% combinded quality flag adapted from Foken et al. 2012, Ch4 of "Eddy 
% Covariance: A Practical Guide to Measurement and Data Analysis", Springer.
% ITC: Wichura and Foken 1995 and Foken and Wichura 1996 (NB: using
% stability range from EDDYCALC - extends Foken's range, values look to 
% asymptote (e.g. Kaimal and Finnigan book) so should be ok for most 
% purposes but use with caution).
% Stationarity - Foken and Wichura 1996.
% Skewness and Kurtosis - Vickers and Mahrt 1997.
%
% IMB, adapted from SJN's original implementation
% JZP, modified to also apply to Ts October 2014
% Bits of code adapted from EDDYCALC suite:
% http://www.swissfluxnet.ch/eddycalc/html/Eddycalc_LI7200.html

% apply any surface displacement
if nargin > 6
  Z = Z-D;
end

reclen = length(u)/(sf*60); % record length in minutes
nblocks = floor(reclen/5); % number of ~5-minute blocks to use
blocklen = floor(length(u)/nblocks);

%% do high order stats tests - skewness & kurtosis (Vickers & Mahrt, 1997)
% flag the sonic vertical velocity data for skewness and kurtosis
QC.skew_w = skew(detrend(w));%skewness(detrend(w));
QC.kurtosis_w = kurtosis(detrend(w))+3; % need Pearson Kurtosis, not Fisher

if abs(QC.skew_w) > 2
  flags.skew_w = 0; % BAD
elseif abs(QC.skew_w) > 1
  flags.skew_w = 2; % OK
else
  flags.skew_w = 1; % GOOD  
end

if QC.kurtosis_w < 1 || QC.kurtosis_w > 8
  flags.kurtosis_w = 0; % BAD
elseif QC.kurtosis_w < 2 || QC.kurtosis_w > 5
  flags.kurtosis_w = 2; % OK
else
  flags.kurtosis_w = 1; % GOOD
end

% flag the sonic alongwind velocity data for skewness and kurtosis
QC.skew_u = skew(detrend(u));%skewness(detrend(u));
QC.kurtosis_u = kurtosis(detrend(u))+3; % need Pearson Kurtosis, not Fisher

if abs(QC.skew_u) > 2
  flags.skew_u = 0; % BAD
elseif abs(QC.skew_u) > 1
  flags.skew_u = 2; % OK
else
  flags.skew_u = 1; % GOOD  
end

if QC.kurtosis_u < 1 || QC.kurtosis_u > 8
  flags.kurtosis_u = 0; % BAD
elseif QC.kurtosis_u < 2 || QC.kurtosis_u > 5
  flags.kurtosis_u = 2; % OK
else
  flags.kurtosis_u = 1; % GOOD
end

% flag the sonic crosswind velocity data for skewness and kurtosis
QC.skew_v = skew(detrend(v));%skewness(detrend(v));
QC.kurtosis_v = kurtosis(detrend(v))+3; % need Pearson Kurtosis, not Fisher

if abs(QC.skew_v) > 2
  flags.skew_v = 0; % BAD
elseif abs(QC.skew_v) > 1
  flags.skew_v = 2; % OK
else
  flags.skew_v = 1; % GOOD  
end

if QC.kurtosis_v < 1 || QC.kurtosis_v > 8
  flags.kurtosis_v = 0; % BAD
elseif QC.kurtosis_v < 2 || QC.kurtosis_v > 5
  flags.kurtosis_v = 2; % OK
else
  flags.kurtosis_v = 1; % GOOD
end

% flag the sonic temperature data for skewness and kurtosis
QC.skew_Ts = skew(detrend(Ts));%skewness(detrend(Ts));
QC.kurtosis_Ts = kurtosis(detrend(Ts))+3; % need Pearson Kurtosis, not Fisher

if abs(QC.skew_Ts) > 2
  flags.skew_Ts = 0; % BAD
elseif abs(QC.skew_Ts) > 1
  flags.skew_Ts = 2; % OK
else
  flags.skew_Ts = 1; % GOOD  
end

if QC.kurtosis_Ts < 1 || QC.kurtosis_Ts > 8
  flags.kurtosis_Ts = 0; % BAD
elseif QC.kurtosis_Ts < 2 || QC.kurtosis_Ts > 5
  flags.kurtosis_Ts = 2; % OK
else
  flags.kurtosis_Ts = 1; % GOOD
end
  
%% do stationarity tests (CarboEurope scheme)
wprime = detrend(w);
uprime = detrend(u);
vprime = detrend(v);
Tprime = detrend(Ts);

% calculate covariances for full record length
Cwu = mean(wprime.*uprime);
Cwv = mean(wprime.*vprime);
Cwt = mean(wprime.*Tprime);

% calculate covariances for sub-blocks of record
Cwub = ones([1,nblocks])*NaN; 
Cwvb = Cwub; 
Cwtb = Cwub;
for n = 1:nblocks
    ii = [1:blocklen] + blocklen*(n-1);
    wprimeb = detrend(w(ii));
    uprimeb = detrend(u(ii));
    vprimeb = detrend(v(ii));
    Tprimeb = detrend(Ts(ii));
    Cwub(n) = mean(wprimeb.*uprimeb);
    Cwvb(n) = mean(wprimeb.*vprimeb);
    Cwtb(n) = mean(wprimeb.*Tprimeb);
end

QC.sst_wu = abs(mean((Cwub - Cwu)/Cwu))*100;
QC.sst_wv = abs(mean((Cwvb - Cwv)/Cwv))*100;
QC.sst_wt = abs(mean((Cwtb - Cwt)/Cwt))*100;
sst = [QC.sst_wu,QC.sst_wv,QC.sst_wt];
sstclass = zeros(size(sst));
for n = 1:length(sst)
  p = sst(n);
  if p >= 0 && p <= 15
    sstclass(n) = 1;
  elseif p > 15 && p <= 30
    sstclass(n) = 2;
  elseif p > 30 && p <= 50
    sstclass(n) = 3;
  elseif p > 50 && p <= 75
    sstclass(n) = 4;
  elseif p > 75 && p <= 100
    sstclass(n) = 5;
  elseif p > 100 && p <= 250
    sstclass(n) = 6;
  elseif p > 250 && p <= 500
    sstclass(n) = 7;
  elseif p > 500 && p <= 1000
    sstclass(n) = 8;
  else
    sstclass(n) = 9;
  end
end
flags.sstclass_wu = sstclass(1);
flags.sstclass_wv = sstclass(2);
flags.sstclass_wt = sstclass(3);

%% do state of turbulence development (integral scale) test

QC.ustar = (Cwu^2 + Cwv^2)^(1/4);   % friction velocity
QC.L = -abs(QC.ustar.^3)*mean(Ts)/(0.4*9.81*Cwt);  % Obukhov length
QC.ZoverL = Z/QC.L;                                % stability parameter

% theoretical value of sigma_w/ustar - parametrisation after Foken/CarboEurope
sigma_uw_theory = 2*abs(QC.ZoverL)^0.125; % 0.032 <= |z/L| <= 1
sigma_uw_theory(abs(QC.ZoverL)>1) = 2; % range |z/L| > 1
sigma_uw_theory(abs(QC.ZoverL)<0.032) = 1.3; % range |z/L| < 0.032

QC.sigma_w = std(wprime);
QC.itc_w = 100*(sigma_uw_theory - (QC.sigma_w/QC.ustar))/sigma_uw_theory;
p = QC.itc_w;
if p >= 0 && p <= 15
  itc_class = 1;
elseif p > 15 && p <= 30
  itc_class = 2;
elseif p > 30 && p <= 50
  itc_class = 3;
elseif p > 50 && p <= 75
  itc_class = 4;
elseif p > 75 && p <= 100
  itc_class = 5;
elseif p > 100 && p <= 250
  itc_class = 6;
elseif p > 250 && p <= 500
  itc_class = 7;
elseif p > 500 && p <= 1000
  itc_class = 8;
else
  itc_class = 9;
end
flags.itc_class = itc_class;

%% combine steady state and turbulence integral scale flags

% along wind momentum flux
if itc_class <= 4 && sstclass(1) <= 2
  quality = 1;  % high quality data, good for fundamental research
elseif itc_class <= 5 && sstclass(1) <= 5
  quality = 2;  % OK for general use
elseif itc_class < 9 && sstclass(1) < 9
  quality = 3;  % highly suspect - may be OK for gap filling, 
                % but needs sanity checking
else
  quality = 0;  % garbage
end
flags.quality_wu = quality;

% cross wind momentum flux
if itc_class <= 4 && sstclass(2) <= 2
  quality = 1;  % high quality data, good for fundamental research
elseif itc_class <= 5 && sstclass(2) <= 5
  quality = 2;  % OK for general use
elseif itc_class < 9 && sstclass(2) < 9
  quality = 3;  % highly suspect - may be OK for gap filling, 
                % but needs sanity checking
else
  quality = 0;  % garbage
end
flags.quality_wv = quality;

% sonic temp flux
if itc_class <= 4 && sstclass(3) <= 2
  quality = 1;  % high quality data, good for fundamental research
elseif itc_class <= 5 && sstclass(3) <= 5
  quality = 2;  % OK for general use
elseif itc_class < 9 && sstclass(3) < 9
  quality = 3;  % highly suspect - may be OK for gap filling, 
                % but needs sanity checking
else
  quality = 0;  % garbage
end
flags.quality_wt = quality;

