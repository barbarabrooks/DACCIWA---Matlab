function write_NC_data_HATPRO_MET_v2(fn_nc, meta, data)
%get rid of NaN
    ix=find(isnan(data.T)==1);
    if ~isempty(ix)
        data.T(ix)=-1e20;   
    end
    
    ix=find(isnan(data.PP)==1);
    if ~isempty(ix)
        data.PP(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.RH)==1);
    if ~isempty(ix)
        data.RH(ix)=-1e20;   
    end
    
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
    
    nc_varput(fn_nc,'air_pressure',data.PP);
    nc_varput(fn_nc,'air_temperature',data.T);
    nc_varput(fn_nc,'relative_humidity',data.RH);
   
    nc_varput(fn_nc,'qc_flag_temperature',data.flag.T);
    nc_varput(fn_nc,'qc_flag_relative_humidity',data.flag.RH);
    nc_varput(fn_nc,'qc_flag_pressure',data.flag.PP);
    nc_varput(fn_nc,'qc_flag_precipitation',data.flag.RAIN);
    