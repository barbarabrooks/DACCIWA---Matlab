function write_NC_data_EB_RAD_v2(fn_nc, meta, data)
%get rid of NaN
    ix=find(isnan(data.RD.SWUP)==1);
    if ~isempty(ix)
        data.RD.SWUP(ix)=-1e20;   
    end
    
    ix=find(isnan(data.RD.SWDN)==1);
    if ~isempty(ix)
        data.RD.SWDN(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.RD.IRUPCOR)==1);
    if ~isempty(ix)
        data.RD.IRUPCOR(ix)=-1e20;   
    end
    
    ix=find(isnan(data.RD.IRDNCOR)==1);
    if ~isempty(ix)
        data.RD.IRDNCOR(ix)=-1e20;   
    end
    
%Save data
    nc_varput(fn_nc,'time',data.RD.ET);
    nc_varput(fn_nc,'day_of_year',data.RD.DoY);
    nc_varput(fn_nc,'year',data.RD.DT(:,1));
    nc_varput(fn_nc,'month',data.RD.DT(:,2));
    nc_varput(fn_nc,'day',data.RD.DT(:,3));
    nc_varput(fn_nc,'hour',data.RD.DT(:,4));
    nc_varput(fn_nc,'minute',data.RD.DT(:,5));
    nc_varput(fn_nc,'second',data.RD.DT(:,6));
    nc_varput(fn_nc,'latitude',meta{length(meta)-2});
    nc_varput(fn_nc,'longitude',meta{length(meta)-1});
    
    nc_varput(fn_nc,'downwelling_longwave_flux_in_air',data.RD.IRUPCOR);
    nc_varput(fn_nc,'upwelling_longwave_flux_in_air',data.RD.IRDNCOR);
    nc_varput(fn_nc,'downwelling_shortwave_flux_in_air',data.RD.SWUP);
    nc_varput(fn_nc,'upwelling_shortwave_flux_in_air',data.RD.SWDN);
   
    nc_varput(fn_nc,'qc_flag_upwelling_shortwave',data.RD.flag.SWDN);
    nc_varput(fn_nc,'qc_flag_downwelling_shortwave',data.RD.flag.SWUP);
    nc_varput(fn_nc,'qc_flag_upwelling_longwave',data.RD.flag.IRDNCOR);
    nc_varput(fn_nc,'qc_flag_downwelling_longwave',data.RD.flag.IRUPCOR);
    nc_varput(fn_nc,'qc_flag_body_temperature',data.RD.flag.BodyT);
    nc_varput(fn_nc,'qc_flag_cleaning',data.RD.flag.Cleaning);