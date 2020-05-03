function write_NC_data_flux_comp(fn_nc, meta, data)

%find end of run
[ri,tt]=size(data.fluxes.flux_runs.ET);
end_of_run=ones(ri,1);
for n=1:ri
    ix=find(~isnan(data.fluxes.flux_runs.ET(n,:))==1);
    end_of_run(n)=data.fluxes.flux_runs.ET(n,ix(end));
end
    
%get rid of NaN
ix=find(isnan(data.fluxes.flux_runs.licor.T));
if ~isempty(ix)
    data.fluxes.flux_runs.licor.T(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.licor.PP));
if ~isempty(ix)
    data.fluxes.flux_runs.licor.PP(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.licor.DPT));
if ~isempty(ix)
    data.fluxes.flux_runs.licor.DPT(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.licor.CO2));
if ~isempty(ix)
    data.fluxes.flux_runs.licor.CO2(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.licor.H2O));
if ~isempty(ix)
    data.fluxes.flux_runs.licor.H2O(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.sonic.Ts));
if ~isempty(ix)
    data.fluxes.flux_runs.sonic.Ts(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.sonic.xyz_earth));
if ~isempty(ix)
    data.fluxes.flux_runs.sonic.xyz_earth(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.sonic.xyz_rotated));
if ~isempty(ix)
    data.fluxes.flux_runs.sonic.xyz_rotated(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.QC.skew_u));
if ~isempty(ix)
    data.fluxes.flux_runs.QC.skew_u(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.QC.skew_v));
if ~isempty(ix)
    data.fluxes.flux_runs.QC.skew_v(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.QC.skew_w));
if ~isempty(ix)
    data.fluxes.flux_runs.QC.skew_w(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.QC.skew_T));
if ~isempty(ix)
    data.fluxes.flux_runs.QC.skew_T(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.QC.kurtosis_u));
if ~isempty(ix)
    data.fluxes.flux_runs.QC.kurtosis_u(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.QC.kurtosis_v));
if ~isempty(ix)
    data.fluxes.flux_runs.QC.kurtosis_v(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.QC.kurtosis_w));
if ~isempty(ix)
    data.fluxes.flux_runs.QC.kurtosis_w(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.QC.kurtosis_T));
if ~isempty(ix)
    data.fluxes.flux_runs.QC.kurtosis_T(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.QC.sst_wu));
if ~isempty(ix)
    data.fluxes.flux_runs.QC.sst_wu(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.QC.sst_wv));
if ~isempty(ix)
    data.fluxes.flux_runs.QC.sst_wv(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.QC.sst_wt));
if ~isempty(ix)
    data.fluxes.flux_runs.QC.sst_wt(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.QC.ustar));
if ~isempty(ix)
    data.fluxes.flux_runs.QC.ustar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.QC.L));
if ~isempty(ix)
    data.fluxes.flux_runs.QC.L(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.QC.sigma_w));
if ~isempty(ix)
    data.fluxes.flux_runs.QC.sigma_w(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.QC.itc_w));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_runs.QC.itc_w(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.uBar));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.uBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.vBar));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.vBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.wBar));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.wBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.CO2Bar));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.CO2Bar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.H2OBar));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.H2OBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.uPrime));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.uPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.vPrime));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.vPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.wPrime));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.wPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.CO2Prime));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.CO2Prime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.H2OPrime));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.H2OPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.wPrimeuPrime));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.wPrimeuPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.wPrimevPrime));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.wPrimevPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.wPrimewPrime));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.wPrimewPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.uPrimeuPrime));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.uPrimeuPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.vPrimevPrime));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.vPrimevPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.wPrimeTsPrime));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.wPrimeTsPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.wPrimeCO2Prime));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.wPrimeCO2Prime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.wPrimeH2OPrime));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.wPrimeH2OPrime(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.wPrimeuPrimeBar));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.wPrimeuPrimeBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.wPrimevPrimeBar));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.wPrimevPrimeBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.wPrimewPrimeBar));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.wPrimewPrimeBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.uPrimeuPrimeBar));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.uPrimeuPrimeBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.vPrimevPrimeBar));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.vPrimevPrimeBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.wPrimeTsPrimeBar));
if ~isempty(ix)
    data.fluxes.flux_runs.lux_components.wPrimeTsPrimeBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.wPrimeCO2PrimeBar));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.wPrimeCO2PrimeBar(ix)=-1e20;
end
clear ix

ix=find(isnan(data.fluxes.flux_runs.flux_components.wPrimeH2OPrimeBar));
if ~isempty(ix)
    data.fluxes.flux_runs.flux_components.wPrimeH2OPrimeBar(ix)=-1e20;
end
clear ix

%Save data
    nc_varput(fn_nc,'time',end_of_run);
    nc_varput(fn_nc,'latitude',meta.LAT);
    nc_varput(fn_nc,'longitude',meta.LON);
    nc_varput(fn_nc,'run_time_ET',data.fluxes.flux_runs.ET);
    nc_varput(fn_nc,'run_start_time_ET',data.fluxes.flux_runs.ET(:,1));
    
    nc_varput(fn_nc,'air_temperature',data.fluxes.flux_runs.licor.T+273.15);
    nc_varput(fn_nc,'surface_air_pressure',data.fluxes.flux_runs.licor.PP.*10);
    nc_varput(fn_nc,'dew_point_temperature',data.fluxes.flux_runs.licor.DPT+273.15);
    nc_varput(fn_nc,'mole_concentration_of_carbon_dioxide_in_air',data.fluxes.flux_runs.licor.CO2(:,:,1)./1000);
    nc_varput(fn_nc,'mole_concentration_of_water_vapor_in_air',data.fluxes.flux_runs.licor.H2O(:,:,1)./1000);
 
    nc_varput(fn_nc,'sonic_air_temperature',data.fluxes.flux_runs.sonic.Ts);
    nc_varput(fn_nc,'sonic_u_earth',data.fluxes.flux_runs.sonic.xyz_earth(:,:,1));
    nc_varput(fn_nc,'sonic_v_earth',data.fluxes.flux_runs.sonic.xyz_earth(:,:,2));
    nc_varput(fn_nc,'sonic_w_earth',data.fluxes.flux_runs.sonic.xyz_earth(:,:,3));
    nc_varput(fn_nc,'sonic_u_run',data.fluxes.flux_runs.sonic.xyz_rotated(:,:,1));
    nc_varput(fn_nc,'sonic_v_run',data.fluxes.flux_runs.sonic.xyz_rotated(:,:,2));
    nc_varput(fn_nc,'sonic_w_run',data.fluxes.flux_runs.sonic.xyz_rotated(:,:,3));
    
    nc_varput(fn_nc,'skew_u',data.fluxes.flux_runs.QC.skew_u);
    nc_varput(fn_nc,'skew_v',data.fluxes.flux_runs.QC.skew_v);
    nc_varput(fn_nc,'skew_w',data.fluxes.flux_runs.QC.skew_w);
    nc_varput(fn_nc,'skew_Ts',data.fluxes.flux_runs.QC.skew_T);
    nc_varput(fn_nc,'kurtosis_u',data.fluxes.flux_runs.QC.kurtosis_u);
    nc_varput(fn_nc,'kurtosis_v',data.fluxes.flux_runs.QC.kurtosis_v);
    nc_varput(fn_nc,'kurtosis_w',data.fluxes.flux_runs.QC.kurtosis_w);
    nc_varput(fn_nc,'kurtosis_Ts',data.fluxes.flux_runs.QC.kurtosis_T);
    nc_varput(fn_nc,'sst_wu',data.fluxes.flux_runs.QC.sst_wu);
    nc_varput(fn_nc,'sst_wv',data.fluxes.flux_runs.QC.sst_wv);
    nc_varput(fn_nc,'sst_wt',data.fluxes.flux_runs.QC.sst_wt);
    nc_varput(fn_nc,'friction_velocity',data.fluxes.flux_runs.QC.ustar);
    nc_varput(fn_nc,'obukhov_length',data.fluxes.flux_runs.QC.L);
    nc_varput(fn_nc,'stability_parameter',data.fluxes.flux_runs.QC.ZoverL);
    nc_varput(fn_nc,'sigma_w',data.fluxes.flux_runs.QC.sigma_w);
    nc_varput(fn_nc,'itc_w',data.fluxes.flux_runs.QC.itc_w);
    
    nc_varput(fn_nc,'qc_flag_skew_u',data.fluxes.flux_runs.QC.flag.skew_u);
    nc_varput(fn_nc,'qc_flag_skew_v',data.fluxes.flux_runs.QC.flag.skew_v);
    nc_varput(fn_nc,'qc_flag_skew_w',data.fluxes.flux_runs.QC.flag.skew_w);
    nc_varput(fn_nc,'qc_flag_skew_Ts',data.fluxes.flux_runs.QC.flag.skew_T);
    nc_varput(fn_nc,'qc_flag_kurtosis_u',data.fluxes.flux_runs.QC.flag.kurtosis_u);
    nc_varput(fn_nc,'qc_flag_kurtosis_v',data.fluxes.flux_runs.QC.flag.kurtosis_v);
    nc_varput(fn_nc,'qc_flag_kurtosis_w',data.fluxes.flux_runs.QC.flag.kurtosis_w);
    nc_varput(fn_nc,'qc_flag_kurtosis_Ts',data.fluxes.flux_runs.QC.flag.kurtosis_T);
    nc_varput(fn_nc,'qc_flag_sstclass_wu',data.fluxes.flux_runs.QC.flag.sstclass_wu);
    nc_varput(fn_nc,'qc_flag_sstclass_wv',data.fluxes.flux_runs.QC.flag.sstclass_wv);
    nc_varput(fn_nc,'qc_flag_sstclass_wt',data.fluxes.flux_runs.QC.flag.sstclass_wt);
    nc_varput(fn_nc,'qc_flag_quality_wu',data.fluxes.flux_runs.QC.flag.quality_wu);
    nc_varput(fn_nc,'qc_flag_quality_wv',data.fluxes.flux_runs.QC.flag.quality_wv);
    nc_varput(fn_nc,'qc_flag_quality_wt',data.fluxes.flux_runs.QC.flag.quality_wt);
    nc_varput(fn_nc,'qc_flag_itc_class',data.fluxes.flux_runs.QC.flag.itc_class);
    
    nc_varput(fn_nc,'uBar',data.fluxes.flux_runs.flux_components.uBar);
    nc_varput(fn_nc,'vBar',data.fluxes.flux_runs.flux_components.vBar);
    nc_varput(fn_nc,'wBar',data.fluxes.flux_runs.flux_components.wBar);
    nc_varput(fn_nc,'TsBar',data.fluxes.flux_runs.flux_components.TsBar);
    nc_varput(fn_nc,'CO2Bar',data.fluxes.flux_runs.flux_components.CO2Bar(:,1)./1000);
    nc_varput(fn_nc,'H2OBar',data.fluxes.flux_runs.flux_components.H2OBar(:,1)./1000);
    nc_varput(fn_nc,'uPrime',data.fluxes.flux_runs.flux_components.uPrime);
    nc_varput(fn_nc,'vPrime',data.fluxes.flux_runs.flux_components.vPrime);
    nc_varput(fn_nc,'wPrime',data.fluxes.flux_runs.flux_components.wPrime);
    nc_varput(fn_nc,'TsPrime',data.fluxes.flux_runs.flux_components.TsPrime);
    nc_varput(fn_nc,'CO2Prime',data.fluxes.flux_runs.flux_components.CO2Prime(:,:,1)./1000);
    nc_varput(fn_nc,'H2OPrime',data.fluxes.flux_runs.flux_components.H2OPrime(:,:,1)./1000);
    nc_varput(fn_nc,'wPrimeuPrime',data.fluxes.flux_runs.flux_components.wPrimeuPrime);
    nc_varput(fn_nc,'wPrimevPrime',data.fluxes.flux_runs.flux_components.wPrimevPrime);
    nc_varput(fn_nc,'wPrimewPrime',data.fluxes.flux_runs.flux_components.wPrimewPrime);
    nc_varput(fn_nc,'uPrimeuPrime',data.fluxes.flux_runs.flux_components.uPrimeuPrime);
    nc_varput(fn_nc,'vPrimevPrime',data.fluxes.flux_runs.flux_components.vPrimevPrime);
    nc_varput(fn_nc,'wPrimeTsPrime',data.fluxes.flux_runs.flux_components.wPrimeTsPrime);
    nc_varput(fn_nc,'wPrimeCO2Prime',data.fluxes.flux_runs.flux_components.wPrimeCO2Prime(:,1)./1000);
    nc_varput(fn_nc,'wPrimeH2OPrime',data.fluxes.flux_runs.flux_components.wPrimeH2OPrime(:,1)./1000);
    nc_varput(fn_nc,'wPrimeuPrimeBar',data.fluxes.flux_runs.flux_components.wPrimeuPrimeBar);
    nc_varput(fn_nc,'wPrimevPrimeBar',data.fluxes.flux_runs.flux_components.wPrimevPrimeBar);
    nc_varput(fn_nc,'wPrimewPrimeBar',data.fluxes.flux_runs.flux_components.wPrimewPrimeBar);
    nc_varput(fn_nc,'uPrimeuPrimeBar',data.fluxes.flux_runs.flux_components.uPrimeuPrimeBar);
    nc_varput(fn_nc,'vPrimevPrimeBar',data.fluxes.flux_runs.flux_components.vPrimevPrimeBar);
    nc_varput(fn_nc,'wPrimeTsPrimeBar',data.fluxes.flux_runs.flux_components.wPrimeTsPrimeBar);
    nc_varput(fn_nc,'wPrimeCO2PrimeBar',data.fluxes.flux_runs.flux_components.wPrimeCO2PrimeBar(:,1)./1000);
    nc_varput(fn_nc,'wPrimeH2OPrimeBar',data.fluxes.flux_runs.flux_components.wPrimeH2OPrimeBar(:,1)./1000);
   