function write_NC_data_HATPRO_MET_v3(fn_nc, meta, data)
%check if on moving platform and set flag
    moving = 0;% flag to indicate if platform in mving set stationary as default
    for n=1:length(meta)
        if strfind(meta{n,2},'moving_platform')
            moving = 1;
        end
    end    

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
    
    if moving == 1
        ix=find(isnan(data.lat)==1);
        if ~isempty(ix)
            data.lat(ix)=-1e20;   
        end
    
        ix=find(isnan(data.lon)==1);
        if ~isempty(ix)
            data.lon(ix)=-1e20;   
        end
    
        ix=find(isnan(data.heading)==1);
        if ~isempty(ix)
            data.heading(ix)=-1e20;   
        end
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
    
    if moving == 0
        for n = 1 : length(meta)
            if strfind(meta{n,1},'platform_location')
                temp=meta{n,2};
            end
        end
        ix2=strfind(temp,'(');
        ix4=strfind(temp,')');
        lat=str2num(temp(ix2(1)+1:ix4(1)-1));
        lon=str2num(temp(ix2(2)+1:ix4(2)-1));
        nc_varput(fn_nc,'latitude',lat);
        nc_varput(fn_nc,'longitude',lon);
    end
    
    if moving == 1
        nc_varput(fn_nc,'latitude',data.lat);
        nc_varput(fn_nc,'longitude',data.lon);
        nc_varput(fn_nc,'platform_orientation',data.heading);
    end
    
    nc_varput(fn_nc,'air_pressure',data.PP);
    nc_varput(fn_nc,'air_temperature',data.T);
    nc_varput(fn_nc,'relative_humidity',data.RH);
   
    nc_varput(fn_nc,'qc_flag_temperature',data.flag.T);
    nc_varput(fn_nc,'qc_flag_relative_humidity',data.flag.RH);
    nc_varput(fn_nc,'qc_flag_pressure',data.flag.PP);
    nc_varput(fn_nc,'qc_flag_precipitation',data.flag.RAIN);
    