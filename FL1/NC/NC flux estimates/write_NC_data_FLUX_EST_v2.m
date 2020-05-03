function write_NC_data_FLUX_EST_v2(fn_nc, meta, data)
ix=find(isnan(data.runs.start_of_run_ST));
if ~isempty(ix)
    data.runs.start_of_run_ST(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.length_of_run));
if ~isempty(ix)
    data.runs.length_of_run(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.number_of_samples));
if ~isempty(ix)
    data.runs.number_of_samples(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_estimates.PF));
if ~isempty(ix)
    data.runs.flux_estimates.PF(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_estimates.KHF));
if ~isempty(ix)
    data.runs.flux_estimates.KHF(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_estimates.KSTF));
if ~isempty(ix)
    data.runs.flux_estimates.KSTF(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_estimates.SHF));
if ~isempty(ix)
    data.runs.flux_estimates.SHF(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_estimates.LHF));
if ~isempty(ix)
    data.runs.flux_estimates.LHF(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_estimates.MOMFU));
if ~isempty(ix)
    data.runs.flux_estimates.MOMFU(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_estimates.MOMFV));
if ~isempty(ix)
    data.runs.flux_estimates.MOMFV(ix)=-1e20;
end
clear ix

ix=find(isnan(data.runs.flux_estimates.B));
if ~isempty(ix)
    data.runs.flux_estimates.B(ix)=-1e20;
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
    nc_varput(fn_nc,'bouyancy_flux',data.runs.flux_estimates.PF);
    nc_varput(fn_nc,'kinematic_humidity_flux',data.runs.flux_estimates.KHF);
    nc_varput(fn_nc,'kinematic_sonic_temperature_flux',data.runs.flux_estimates.KSTF);
    nc_varput(fn_nc,'upward_sensible_heat_flux_in_air',data.runs.flux_estimates.SHF);
    nc_varput(fn_nc,'upward_latent_heat_flux_in_air',data.runs.flux_estimates.LHF);
    nc_varput(fn_nc,'momentum_flux_u',data.runs.flux_estimates.MOMFU);
    nc_varput(fn_nc,'momentum_flux_v',data.runs.flux_estimates.MOMFV);
    nc_varput(fn_nc,'bowen_ratio',data.runs.flux_estimates.B);
    
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
    
    
   