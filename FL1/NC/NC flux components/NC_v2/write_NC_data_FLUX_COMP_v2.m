function write_NC_data_FLUX_COMP_v2(fn_nc, meta, data)
%get rid of NaN
ix=find(isnan(data.runs.licor.T));
if ~isempty(ix)
    data.runs.licor.T(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.licor.PP));
if ~isempty(ix)
    data.runs.licor.PP(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.licor.CO2));
if ~isempty(ix)
    data.runs.licor.CO2(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.licor.H2O));
if ~isempty(ix)
    data.runs.licor.H2O(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.water.Q));
if ~isempty(ix)
    data.runs.water.Q(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.water.PPwet));
if ~isempty(ix)
    data.runs.water.PPwet(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.water.WVMMR));
if ~isempty(ix)
    data.runs.water.WVMMR(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.water.T));
if ~isempty(ix)
    data.runs.water.T(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.sonic.Ts));
if ~isempty(ix)
    data.runs.sonic.Ts(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.sonic.xyz_earth));
if ~isempty(ix)
    data.runs.sonic.xyz_earth(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.sonic.xyz_rotated));
if ~isempty(ix)
    data.runs.sonic.xyz_rotated(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.QC.skew_u));
if ~isempty(ix)
    data.runs.QC.skew_u(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.QC.skew_v));
if ~isempty(ix)
    data.runs.QC.skew_v(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.QC.skew_w));
if ~isempty(ix)
    data.runs.QC.skew_w(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.QC.skew_T));
if ~isempty(ix)
    data.runs.QC.skew_T(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.QC.kurtosis_u));
if ~isempty(ix)
    data.runs.QC.kurtosis_u(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.QC.kurtosis_v));
if ~isempty(ix)
    data.runs.QC.kurtosis_v(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.QC.kurtosis_w));
if ~isempty(ix)
    data.runs.QC.kurtosis_w(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.QC.kurtosis_T));
if ~isempty(ix)
    data.runs.QC.kurtosis_T(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.QC.sst_wu));
if ~isempty(ix)
    data.runs.QC.sst_wu(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.QC.sst_wv));
if ~isempty(ix)
    data.runs.QC.sst_wv(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.QC.sst_wt));
if ~isempty(ix)
    data.runs.QC.sst_wt(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.QC.ustar));
if ~isempty(ix)
    data.runs.QC.ustar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.QC.L));
if ~isempty(ix)
    data.runs.QC.L(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.QC.sigma_w));
if ~isempty(ix)
    data.runs.QC.sigma_w(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.QC.itc_w));
if ~isempty(ix)
    data.runs.QC.itc_w(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.uBar));
if ~isempty(ix)
    data.runs.flux_components.uBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.vBar));
if ~isempty(ix)
    data.runs.flux_components.vBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wBar));
if ~isempty(ix)
    data.runs.flux_components.wBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.CO2Bar));
if ~isempty(ix)
    data.runs.flux_components.CO2Bar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.H2OBar));
if ~isempty(ix)
    data.runs.flux_components.H2OBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.QBar));
if ~isempty(ix)
    data.runs.flux_components.QBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.ThetaBar));
if ~isempty(ix)
    data.runs.flux_components.ThetaBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.WVMMRBar));
if ~isempty(ix)
    data.runs.flux_components.WVMMRBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.uPrime));
if ~isempty(ix)
    data.runs.flux_components.uPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.vPrime));
if ~isempty(ix)
    data.runs.flux_components.vPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrime));
if ~isempty(ix)
    data.runs.flux_components.wPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.CO2Prime));
if ~isempty(ix)
    data.runs.flux_components.CO2Prime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.H2OPrime));
if ~isempty(ix)
    data.runs.flux_components.H2OPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.QPrime));
if ~isempty(ix)
    data.runs.flux_components.QPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.ThetaPrime));
if ~isempty(ix)
    data.runs.flux_components.ThetaPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.WVMMRPrime));
if ~isempty(ix)
    data.runs.flux_components.WVMMRPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimeuPrime));
if ~isempty(ix)
    data.runs.flux_components.wPrimeuPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimevPrime));
if ~isempty(ix)
    data.runs.flux_components.wPrimevPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimewPrime));
if ~isempty(ix)
    data.runs.flux_components.wPrimewPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.uPrimeuPrime));
if ~isempty(ix)
    data.runs.flux_components.uPrimeuPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.vPrimevPrime));
if ~isempty(ix)
    data.runs.flux_components.vPrimevPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimeTsPrime));
if ~isempty(ix)
    data.runs.flux_components.wPrimeTsPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimeCO2Prime));
if ~isempty(ix)
    data.runs.flux_components.wPrimeCO2Prime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimeH2OPrime));
if ~isempty(ix)
    data.runs.flux_components.wPrimeH2OPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimeQPrime));
if ~isempty(ix)
    data.runs.flux_components.wPrimeQPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimeThetaPrime));
if ~isempty(ix)
    data.runs.flux_components.wPrimeThetaPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimeWVMMRPrime));
if ~isempty(ix)
    data.runs.flux_components.wPrimeWVMMRPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimeuPrimeBar));
if ~isempty(ix)
    data.runs.flux_components.wPrimeuPrimeBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimevPrimeBar));
if ~isempty(ix)
    data.runs.flux_components.wPrimevPrimeBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimewPrimeBar));
if ~isempty(ix)
    data.runs.flux_components.wPrimewPrimeBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.uPrimeuPrimeBar));
if ~isempty(ix)
    data.runs.flux_components.uPrimeuPrimeBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.vPrimevPrimeBar));
if ~isempty(ix)
    data.runs.flux_components.vPrimevPrimeBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimeTsPrimeBar));
if ~isempty(ix)
    data.runs.flux_components.wPrimeTsPrimeBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimeCO2PrimeBar));
if ~isempty(ix)
    data.runs.flux_components.wPrimeCO2PrimeBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimeH2OPrimeBar));
if ~isempty(ix)
    data.runs.flux_components.wPrimeH2OPrimeBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimeQPrimeBar));
if ~isempty(ix)
    data.runs.flux_components.wPrimeQPrimeBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimeThetaPrimeBar));
if ~isempty(ix)
    data.runs.flux_components.wPrimeThetaPrimeBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_components.wPrimeWVMMRPrimeBar));
if ~isempty(ix)
    data.runs.flux_components.wPrimeWVMMRPrimeBar(ix)=-1e20;
end
clear ix

%Save data
    nc_varput(fn_nc,'time',data.runs.end_of_run_ET);
    nc_varput(fn_nc,'day_of_year',data.runs.end_of_run_DoY);
    nc_varput(fn_nc,'year',data.runs.end_of_run_DT(:,1));
    nc_varput(fn_nc,'month',data.runs.end_of_run_DT(:,2));
    nc_varput(fn_nc,'day',data.runs.end_of_run_DT(:,3));
    nc_varput(fn_nc,'hour',data.runs.end_of_run_DT(:,4));
    nc_varput(fn_nc,'minute',data.runs.end_of_run_DT(:,5));
    nc_varput(fn_nc,'second',data.runs.end_of_run_DT(:,6));
    nc_varput(fn_nc,'latitude',meta{length(meta)-2});
    nc_varput(fn_nc,'longitude',meta{length(meta)-1});
    
    nc_varput(fn_nc,'start_of_run',data.runs.start_of_run_ET);
    nc_varput(fn_nc,'run_length',data.runs.length_of_run);
    nc_varput(fn_nc,'number_of_samples_in_run',data.runs.number_of_samples);
    
    nc_varput(fn_nc,'air_temperature',data.runs.licor.T+273.15);
    nc_varput(fn_nc,'air_pressure',data.runs.licor.PP.*10);
    nc_varput(fn_nc,'mole_concentration_of_carbon_dioxide_in_air',data.runs.licor.CO2(:,:,1));
    nc_varput(fn_nc,'mole_concentration_of_water_vapor_in_air',data.runs.licor.H2O(:,:,1));
    
    nc_varput(fn_nc,'specific humdidity',data.runs.water.Q);
    nc_varput(fn_nc,'water_vapour_partial_pressure',data.runs.water.PPwet);
    nc_varput(fn_nc,'water_vapour_mass_mixing_ratio',data.runs.water.WVMMR(:,:,1));
    nc_varput(fn_nc,'sonic_air_temperature_Q_corrected',data.runs.water.T);
 
    nc_varput(fn_nc,'sonic_air_temperature',data.runs.sonic.Ts+273.15);
    nc_varput(fn_nc,'sonic_u_earth',data.runs.sonic.xyz_earth(:,:,1));
    nc_varput(fn_nc,'sonic_v_earth',data.runs.sonic.xyz_earth(:,:,2));
    nc_varput(fn_nc,'sonic_w_earth',data.runs.sonic.xyz_earth(:,:,3));
    nc_varput(fn_nc,'sonic_u_run',data.runs.sonic.xyz_rotated(:,:,1));
    nc_varput(fn_nc,'sonic_v_run',data.runs.sonic.xyz_rotated(:,:,2));
    nc_varput(fn_nc,'sonic_w_run',data.runs.sonic.xyz_rotated(:,:,3));
    
    nc_varput(fn_nc,'skew_u',data.runs.QC.skew_u);
    nc_varput(fn_nc,'skew_v',data.runs.QC.skew_v);
    nc_varput(fn_nc,'skew_w',data.runs.QC.skew_w);
    nc_varput(fn_nc,'skew_ts',data.runs.QC.skew_T);
    nc_varput(fn_nc,'kurtosis_u',data.runs.QC.kurtosis_u);
    nc_varput(fn_nc,'kurtosis_v',data.runs.QC.kurtosis_v);
    nc_varput(fn_nc,'kurtosis_w',data.runs.QC.kurtosis_w);
    nc_varput(fn_nc,'kurtosis_ts',data.runs.QC.kurtosis_T);
    nc_varput(fn_nc,'sst_wu',data.runs.QC.sst_wu);
    nc_varput(fn_nc,'sst_wv',data.runs.QC.sst_wv);
    nc_varput(fn_nc,'sst_wts',data.runs.QC.sst_wt);
    nc_varput(fn_nc,'friction_velocity',data.runs.QC.ustar);
    nc_varput(fn_nc,'obukhov_length',data.runs.QC.L);
    nc_varput(fn_nc,'stability_parameter',data.runs.QC.ZoverL);
    nc_varput(fn_nc,'sigma_w',data.runs.QC.sigma_w);
    nc_varput(fn_nc,'itc_w',data.runs.QC.itc_w);
    
    nc_varput(fn_nc,'qc_flag_skew_u',data.runs.QC.flag.skew_u);
    nc_varput(fn_nc,'qc_flag_skew_v',data.runs.QC.flag.skew_v);
    nc_varput(fn_nc,'qc_flag_skew_w',data.runs.QC.flag.skew_w);
    nc_varput(fn_nc,'qc_flag_skew_ts',data.runs.QC.flag.skew_T);
    nc_varput(fn_nc,'qc_flag_kurtosis_u',data.runs.QC.flag.kurtosis_u);
    nc_varput(fn_nc,'qc_flag_kurtosis_v',data.runs.QC.flag.kurtosis_v);
    nc_varput(fn_nc,'qc_flag_kurtosis_w',data.runs.QC.flag.kurtosis_w);
    nc_varput(fn_nc,'qc_flag_kurtosis_ts',data.runs.QC.flag.kurtosis_T);
    nc_varput(fn_nc,'qc_flag_sstclass_wu',data.runs.QC.flag.sstclass_wu);
    nc_varput(fn_nc,'qc_flag_sstclass_wv',data.runs.QC.flag.sstclass_wv);
    nc_varput(fn_nc,'qc_flag_sstclass_wts',data.runs.QC.flag.sstclass_wt);
    nc_varput(fn_nc,'qc_flag_quality_wu',data.runs.QC.flag.quality_wu);
    nc_varput(fn_nc,'qc_flag_quality_wv',data.runs.QC.flag.quality_wv);
    nc_varput(fn_nc,'qc_flag_quality_wts',data.runs.QC.flag.quality_wt);
    nc_varput(fn_nc,'qc_flag_itc_class',data.runs.QC.flag.itc_class);
    
    nc_varput(fn_nc,'ubar',data.runs.flux_components.uBar);
    nc_varput(fn_nc,'vbar',data.runs.flux_components.vBar);
    nc_varput(fn_nc,'wbar',data.runs.flux_components.wBar);
    nc_varput(fn_nc,'tsbar',data.runs.flux_components.TsBar);
    nc_varput(fn_nc,'co2bar',data.runs.flux_components.CO2Bar(:,1));
    nc_varput(fn_nc,'h2obar',data.runs.flux_components.H2OBar(:,1));
    nc_varput(fn_nc,'qbar',data.runs.flux_components.QBar);
    nc_varput(fn_nc,'thetabar',data.runs.flux_components.ThetaBar);
    nc_varput(fn_nc,'wvmmrbar',data.runs.flux_components.WVMMRBar(:,1));
    
    nc_varput(fn_nc,'uprime',data.runs.flux_components.uPrime);
    nc_varput(fn_nc,'vprime',data.runs.flux_components.vPrime);
    nc_varput(fn_nc,'wprime',data.runs.flux_components.wPrime);
    nc_varput(fn_nc,'tsprime',data.runs.flux_components.TsPrime);
    nc_varput(fn_nc,'co2prime',data.runs.flux_components.CO2Prime(:,:,1));
    nc_varput(fn_nc,'h2oprime',data.runs.flux_components.H2OPrime(:,:,1));
    nc_varput(fn_nc,'qprime',data.runs.flux_components.QPrime);
    nc_varput(fn_nc,'thetaprime',data.runs.flux_components.ThetaPrime);
    nc_varput(fn_nc,'wvmmrprime',data.runs.flux_components.WVMMRPrime(:,:,1));
    
    nc_varput(fn_nc,'wprimeuprime',data.runs.flux_components.wPrimeuPrime);
    nc_varput(fn_nc,'wprimevprime',data.runs.flux_components.wPrimevPrime);
    nc_varput(fn_nc,'wprimewprime',data.runs.flux_components.wPrimewPrime);
    nc_varput(fn_nc,'uprimeuprime',data.runs.flux_components.uPrimeuPrime);
    nc_varput(fn_nc,'vprimevprime',data.runs.flux_components.vPrimevPrime);
    nc_varput(fn_nc,'wprimetsprime',data.runs.flux_components.wPrimeTsPrime);
    nc_varput(fn_nc,'wprimeco2prime',data.runs.flux_components.wPrimeCO2Prime(:,:,1));
    nc_varput(fn_nc,'wprimeh2oprime',data.runs.flux_components.wPrimeH2OPrime(:,:,1));
    nc_varput(fn_nc,'wprimeqprime',data.runs.flux_components.wPrimeQPrime);
    nc_varput(fn_nc,'wprimethetaprime',data.runs.flux_components.wPrimeThetaPrime);
    nc_varput(fn_nc,'wprimewvmmrprime',data.runs.flux_components.wPrimeWVMMRPrime(:,:,1));
    
    nc_varput(fn_nc,'wprimeuprimebar',data.runs.flux_components.wPrimeuPrimeBar);
    nc_varput(fn_nc,'wprimevprimebar',data.runs.flux_components.wPrimevPrimeBar);
    nc_varput(fn_nc,'wprimewprimebar',data.runs.flux_components.wPrimewPrimeBar);
    nc_varput(fn_nc,'uprimeuprimebar',data.runs.flux_components.uPrimeuPrimeBar);
    nc_varput(fn_nc,'vprimevprimebar',data.runs.flux_components.vPrimevPrimeBar);
    nc_varput(fn_nc,'wprimetsprimebar',data.runs.flux_components.wPrimeTsPrimeBar);
    nc_varput(fn_nc,'wprimeco2primebar',data.runs.flux_components.wPrimeCO2PrimeBar(:,1));
    nc_varput(fn_nc,'wprimeh2oprimebar',data.runs.flux_components.wPrimeH2OPrimeBar(:,1));
    nc_varput(fn_nc,'wprimeqprimebar',data.runs.flux_components.wPrimeQPrimeBar);
    nc_varput(fn_nc,'wprimethetaprimebar',data.runs.flux_components.wPrimeThetaPrimeBar);
    nc_varput(fn_nc,'wprimewvmmrprimebar',data.runs.flux_components.wPrimeWVMMRPrimeBar(:,1));
   