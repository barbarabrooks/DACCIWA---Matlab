function write_NC_data_HATPRO_IWVLWP_v3(fn_nc, meta, data)
%check if on moving platform and set flag
    moving = 0;% flag to indicate if platform in mving set stationary as default
    for n=1:length(meta)
        if strfind(meta{n,2},'moving_platform')
            moving = 1;
        end
    end    

%get rid of NaN
    ix=find(isnan(data.IWV)==1);
    if ~isempty(ix)
        data.IWV(ix)=-1e20;   
    end
    
    ix=find(isnan(data.LWP)==1);
    if ~isempty(ix)
        data.LWP(ix)=-1e20;   
    end
    clear ix
    
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
    
    nc_varput(fn_nc,'integrated_water_vapour',data.IWV);
    nc_varput(fn_nc,'liquid_water_path',data.LWP);
   
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