function write_NC_data_MRR_profiles_v2(fn_nc, meta, data)
%get rid of NaN
    ix=find(isnan(data.RR)==1);
    if ~isempty(ix)
        data.RR(ix)=-1e20;   
    end
    
    ix=find(isnan(data.LWC)==1);
    if ~isempty(ix)
        data.LWC(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.W)==1);
    if ~isempty(ix)
        data.W(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.H)==1);
    if ~isempty(ix)
        data.H(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.Z)==1);
    if ~isempty(ix)
        data.Z(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.z)==1);
    if ~isempty(ix)
        data.z(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.PIA)==1);
    if ~isempty(ix)
        data.PIA(ix)=-1e20;   
    end
    clear ix
    
%Save data
    nc_varput(fn_nc,'time',data.ET);
    nc_varput(fn_nc,'day_of_year',data.DoY);
    nc_varput(fn_nc,'year',data.DT(:,1));
    nc_varput(fn_nc,'month',data.DT(:,2));
    nc_varput(fn_nc,'day',data.DT(:,3));
    nc_varput(fn_nc,'hour',data.DT(:,4));
    nc_varput(fn_nc,'minute',data.DT(:,5));
    nc_varput(fn_nc,'second',data.DT(:,6));
    nc_varput(fn_nc,'latitude',meta{length(meta)-2});
    nc_varput(fn_nc,'longitude',meta{length(meta)-1});
    nc_varput(fn_nc,'altitude',(data.H(1,:)+meta{length(meta)}));
    nc_varput(fn_nc,'rainfall_rate',data.RR);
    nc_varput(fn_nc,'rain_liquid_water_content',data.LWC);
    nc_varput(fn_nc,'rain_fall_velocity',data.W);
    nc_varput(fn_nc,'radar_reflectivity',data.Z);
    nc_varput(fn_nc,'attenuated_radar_reflectivity',data.z);
    nc_varput(fn_nc,'path_integrated_attenuation',data.PIA);
    nc_varput(fn_nc,'qc_flag',data.flag.line);
    
    