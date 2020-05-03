function write_NC_IWV_LWP_qc_flags_v4(fn_nc, flag)

%qc_flag_surface_temperature
    %define variable
        ts.Name='qc_flag_surface_temperature';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Surface Temperature';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_temperature_outside_sensor_operational_range',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
    %save data
        nc_varput(fn_nc,'qc_flag_surface_temperature',int8(flag.T));
        
%qc_flag_surface_relative_humidity
    %define variable
        ts.Name='qc_flag_surface_relative_humidity';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Surface Relative Humidity';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_relative_humidity_outside_sensor_operational_range',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data       
        nc_varput(fn_nc,'qc_flag_surface_relative_humidity',int8(flag.RH));
    
 %qc_flag_surface_pressure
    %define variable
        ts.Name='qc_flag_surface_pressure';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Surface Pressure';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_pressure_outside_sensor_operational_range',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data  
        nc_varput(fn_nc,'qc_flag_surface_pressure',int8(flag.PP));
        
 %qc_flag_precipitation
    %define variable
        ts.Name='qc_flag_precipitation';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Precipitation';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'suspect_data_precipitation_detected',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data       
        nc_varput(fn_nc,'qc_flag_precipitation',flag.RAIN);
        
 %qc_flag_channel_1_failure
    %define variable
        ts.Name='qc_flag_channel_1_failure';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Receiver channel 1 failed';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_channel_failure',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data
        nc_varput(fn_nc,'qc_flag_channel_1_failure',flag.CH1);
        
 %qc_flag_channel_2_failure
    %define variable
        ts.Name='qc_flag_channel_2_failure';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Receiver channel 2 failed';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_channel_failure',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data
        nc_varput(fn_nc,'qc_flag_channel_1_failure',flag.CH2);
        
 %qc_flag_channel_3_failure
    %define variable
        ts.Name='qc_flag_channel_3_failure';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Receiver channel 3 failed';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_channel_failure',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data
        nc_varput(fn_nc,'qc_flag_channel_1_failure',flag.CH3);
                
%qc_flag_channel_4_failure
    %define variable
        ts.Name='qc_flag_channel_4_failure';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Receiver channel 4 failed';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_channel_failure',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data
        nc_varput(fn_nc,'qc_flag_channel_1_failure',flag.CH4);
        
%qc_flag_channel_5_failure
    %define variable
        ts.Name='qc_flag_channel_5_failure';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Receiver channel 5 failed';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_channel_failure',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data
        nc_varput(fn_nc,'qc_flag_channel_1_failure',flag.CH5);
        
%qc_flag_channel_6_failure
    %define variable
        ts.Name='qc_flag_channel_6_failure';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Receiver channel 6 failed';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_channel_failure',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data
        nc_varput(fn_nc,'qc_flag_channel_1_failure',flag.CH6);
        
%qc_flag_channel_7_failure
    %define variable
        ts.Name='qc_flag_channel_7_failure';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Receiver channel 7 failed';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_channel_failure',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data
        nc_varput(fn_nc,'qc_flag_channel_1_failure',flag.CH7);
        
%qc_flag_channel_8_failure
    %define variable
        ts.Name='qc_flag_channel_8_failure';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Receiver channel 8 failed';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_channel_failure',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data
        nc_varput(fn_nc,'qc_flag_channel_1_failure',flag.CH8);
        
%qc_flag_channel_9_failure
    %define variable
        ts.Name='qc_flag_channel_9_failure';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Receiver channel 9 failed';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_channel_failure',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data
        nc_varput(fn_nc,'qc_flag_channel_1_failure',flag.CH9);
        
%qc_flag_channel_10_failure
    %define variable
        ts.Name='qc_flag_channel_10_failure';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Receiver channel 10 failed';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_channel_failure',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data
        nc_varput(fn_nc,'qc_flag_channel_1_failure',flag.CH10);
        
%qc_flag_channel_11_failure
    %define variable
        ts.Name='qc_flag_channel_11_failure';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Receiver channel 11 failed';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_channel_failure',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data
        nc_varput(fn_nc,'qc_flag_channel_1_failure',flag.CH11);
        
%qc_flag_channel_12_failure
    %define variable
        ts.Name='qc_flag_channel_12_failure';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Receiver channel 12 failed';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_channel_failure',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data
        nc_varput(fn_nc,'qc_flag_channel_1_failure',flag.CH12);
        
%qc_flag_channel_13_failure
    %define variable
        ts.Name='qc_flag_channel_13_failure';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Receiver channel 13 failed';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_channel_failure',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data
        nc_varput(fn_nc,'qc_flag_channel_1_failure',flag.CH13);
        
%qc_flag_channel_14_failure
    %define variable
        ts.Name='qc_flag_channel_14_failure';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Receiver channel 14 failed';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_channel_failure',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data
        nc_varput(fn_nc,'qc_flag_channel_1_failure',flag.CH14);
        
%qc_flag_t_receiver_temperature_stability
    %defne variable
        ts.Name='qc_flag_t_receiver_temperature_stability';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Thermal stability of temperature receiver bank';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b,4b,5b,6b,7b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data_temperature_stability_in_the_range_0_to_5mK',... 
    'suspect_data_temperature_stability_in_the_range_5_to_10mK',...
    'suspect_data_temperature_stability_in_the_range_10_to_50mK',...
    'suspect_data_temperature_stability_in_the_range_50_to_100mK',...
    'suspect_data_temperature_stability_in_the_range_100_to_500mK',...
    'bad_data_temperature_stability_>500mK',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data
        nc_varput(fn_nc,'qc_flag_t_receiver_temperature_stability',flag.T_stab);
        
%qc_flag_rh_receiver_temperature_stability
    %define variable
        ts.Name='qc_flag_rh_receiver_temperature_stability';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Thermal stability of moisture receiver bank';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b,4b,5b,6b,7b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data_temperature_stability_in_the_range_0_to_5mK',... 
    'suspect_data_temperature_stability_in_the_range_5_to_10mK',...
    'suspect_data_temperature_stability_in_the_range_10_to_50mK',...
    'suspect_data_temperature_stability_in_the_range_50_to_100mK',...
    'suspect_data_temperature_stability_in_the_range_100_to_500mK',...
    'bad_data_temperature_stability_>500mK',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data
        nc_varput(fn_nc,'qc_flag_t_receiver_temperature_stability',flag.RH_stab);     