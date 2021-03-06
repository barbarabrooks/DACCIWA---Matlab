function write_NC_data_HATPRO_STAB(fn_nc, meta, data)
%get rid of NaN
    ix=find(isnan(data.LI)==1);
    if ~isempty(ix)
        data.LI(ix)=-1e20;   
    end
    
    ix=find(isnan(data.KOI)==1);
    if ~isempty(ix)
        data.KOI(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.TTI)==1);
    if ~isempty(ix)
        data.TTI(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.KI)==1);
    if ~isempty(ix)
        data.KI(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.SI)==1);
    if ~isempty(ix)
        data.SI(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.CAPE)==1);
    if ~isempty(ix)
        data.CAPE(ix)=-1e20;   
    end
    clear ix
%Save data
    nc_varput(fn_nc,'time',data.ET);
    nc_varput(fn_nc,'alt_time',data.ST);
    nc_varput(fn_nc,'day_of_year',data.DoY);
    nc_varput(fn_nc,'year',data.DT(:,1));
    nc_varput(fn_nc,'month',data.DT(:,2));
    nc_varput(fn_nc,'day',data.DT(:,3));
    nc_varput(fn_nc,'hour',data.DT(:,4));
    nc_varput(fn_nc,'minute',data.DT(:,5));
    nc_varput(fn_nc,'second',data.DT(:,6));
    nc_varput(fn_nc,'latitude',meta.LAT);
    nc_varput(fn_nc,'longitude',meta.LON);
    
    nc_varput(fn_nc,'lifted_index',data.LI);
    nc_varput(fn_nc,'modified_k_index',data.KOI);
    nc_varput(fn_nc,'atmosphere_stability_total_totals_index',data.TTI);
    nc_varput(fn_nc,'atmosphere_stability_k_index',data.KI);
    nc_varput(fn_nc,'atmosphere_stability_showalter_index',data.SI);
    nc_varput(fn_nc,'atmosphere_convective_available_potential_energy',data.CAPE);
    
    nc_varput(fn_nc,'qc_flag_temperature',data.flag.T);
    nc_varput(fn_nc,'qc_flag_relative_humidity',data.flag.RH);
    nc_varput(fn_nc,'qc_flag_pressure',data.flag.PP);
    nc_varput(fn_nc,'qc_flag_precipitation',data.flag.RAIN);
    nc_varput(fn_nc,'qc_flag_channel_1_failure',data.flag.CH1);
    nc_varput(fn_nc,'qc_flag_channel_2_failure',data.flag.CH2);
    nc_varput(fn_nc,'qc_flag_channel_3_failure',data.flag.CH3);
    nc_varput(fn_nc,'qc_flag_channel_4_failure',data.flag.CH4);
    nc_varput(fn_nc,'qc_flag_channel_5_failure',data.flag.CH5);
    nc_varput(fn_nc,'qc_flag_channel_6_failure',data.flag.CH6);
    nc_varput(fn_nc,'qc_flag_channel_7_failure',data.flag.CH7);
    nc_varput(fn_nc,'qc_flag_channel_8_failure',data.flag.CH8);
    nc_varput(fn_nc,'qc_flag_channel_9_failure',data.flag.CH9);
    nc_varput(fn_nc,'qc_flag_channel_10_failure',data.flag.CH10);
    nc_varput(fn_nc,'qc_flag_channel_11_failure',data.flag.CH11);
    nc_varput(fn_nc,'qc_flag_channel_12_failure',data.flag.CH12);
    nc_varput(fn_nc,'qc_flag_channel_13_failure',data.flag.CH13);
    nc_varput(fn_nc,'qc_flag_channel_14_failure',data.flag.CH14);
    nc_varput(fn_nc,'qc_flag_t_receiver_temperature_stability',data.flag.T_stab);
    nc_varput(fn_nc,'qc_flag_rh_receiver_temperature_stability',data.flag.RH_stab);