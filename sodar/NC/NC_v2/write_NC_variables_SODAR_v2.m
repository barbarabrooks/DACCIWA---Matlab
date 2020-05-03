function write_NC_variables_SODAR_v2(fn_nc, meta, data)
%time
        ts.Name='time';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='seconds since 1970-01-01 00:00:00 UTC';
        as(2).Name='standard_name';as(2).Value='time';
        as(3).Name='long_name';as(3).Value='Time (seconds since 1970-01-01)';
        as(4).Name='axis';as(4).Value='T';
        as(5).Name='valid_min';as(5).Value=min(data.ET);
        as(6).Name='valid_max';as(6).Value=max(data.ET);
        as(7).Name='calendar';as(7).Value='julian';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc   
%altitude
        ts.Name='altitude';
        ts.Nctype='double';
        dc=cell(1);dc{1}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m';
        as(2).Name='standard_name';as(2).Value='altitude';
        as(3).Name='long_name';as(3).Value='Geometric height above geoid.';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='axis';as(5).Value='Z';
        as(6).Name='valid_min';as(6).Value=0;
        as(7).Name='valid_max';as(7).Value=1000+meta{length(meta)};
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc         
%latitude
        ts.Name='latitude';
        ts.Nctype='double';
        dc=cell(1);dc{1}='latitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='degree_north';
        as(2).Name='standard_name';as(2).Value='latitude';
        as(3).Name='long_name';as(3).Value='Latitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%longitude
        ts.Name='longitude';
        ts.Nctype='double';
        dc=cell(1);dc{1}='longitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='degree_east';
        as(2).Name='standard_name';as(2).Value='longitude';
        as(3).Name='long_name';as(3).Value='Longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc       
%day_of_year
        ts.Name='day_of_year';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Day of Year';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=366;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%year
        ts.Name='year';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Year';
        as(3).Name='valid_min';as(3).Value=1900;
        as(4).Name='valid_max';as(4).Value=2100;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%month
        ts.Name='month';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Month';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=12;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%day
        ts.Name='day';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Day';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=31;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%hour
        ts.Name='hour';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Hour';
        as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=23;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%minute
        ts.Name='minute';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Minute';
        as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=59;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%second
        ts.Name='second';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Second';
        as(3).Name='valid_min';as(3).Value=0.0000;
        as(4).Name='valid_max';as(4).Value=59.9999;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
        
%sound_intensity_level_in_air
        ts.Name='sound_intensity_level_in_air';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='dB';
        as(2).Name='standard_name';as(2).Value='sound_intensity_level_in_air';
        as(3).Name='long_name';as(3).Value='Sound Intensity';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=0;
        as(6).Name='valid_max';as(6).Value=5;
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%wind_speed
        ts.Name='wind_speed';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='standard_name';as(2).Value='wind_speed';
        as(3).Name='long_name';as(3).Value='Wind Speed';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=0;
        as(6).Name='valid_max';as(6).Value=20;
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
%wind_from_direction
        ts.Name='wind_from_direction';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='degree';
        as(2).Name='standard_name';as(2).Value='wind_from_direction';
        as(3).Name='long_name';as(3).Value='Wind Direction';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=0;
        as(6).Name='valid_max';as(6).Value=360;
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
%eastward_wind
        ts.Name='eastward_wind';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='standard_name';as(2).Value='eastward_wind';
        as(3).Name='long_name';as(3).Value='U';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=-20;
        as(6).Name='valid_max';as(6).Value=20;
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%northward_wind
        ts.Name='northward_wind';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='standard_name';as(2).Value='northward_wind';
        as(3).Name='long_name';as(3).Value='V';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=-20;
        as(6).Name='valid_max';as(6).Value=20;
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%upward_air_velocity
        ts.Name='upward_air_velocity';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='standard_name';as(2).Value='upward_air_velocity';
        as(3).Name='long_name';as(3).Value='W';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=-10;
        as(6).Name='valid_max';as(6).Value=10;
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%divergence_of_eastward_wind
        ts.Name='divergence_of_eastward_wind';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='standard_name';as(2).Value='divergence_of_eastward_wind';
        as(3).Name='long_name';as(3).Value='Sigma U';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=-5;
        as(6).Name='valid_max';as(6).Value=5;
        as(7).Name='cell_methods';as(7).Value='time: standard_deviation';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc   
%divergence_of_northward_wind
        ts.Name='divergence_of_northward_wind';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='standard_name';as(2).Value='divergence_of_northward_wind';
        as(3).Name='long_name';as(3).Value='Sigma V';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=-5;
        as(6).Name='valid_max';as(6).Value=5;
        as(7).Name='cell_methods';as(7).Value='time: standard_deviation';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%divergence_of_upward_air_velocity
        ts.Name='divergence_of_upward_air_velocity';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='standard_name';as(2).Value='divergence_of_upward_air_velocity';
        as(3).Name='long_name';as(3).Value='Sigma W';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=-5;
        as(6).Name='valid_max';as(6).Value=5;
        as(7).Name='cell_methods';as(7).Value='time: standard_deviation';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
        
%qc_flag_mean_winds
        ts.Name='qc_flag_mean_winds';
        ts.Nctype='int';
        c=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Mean Winds';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=5;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%qc_flag_wind_component_eastward
        ts.Name='qc_flag_wind_component_eastward';
        ts.Nctype='int';
       c=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Wind Component U';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=4;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%qc_flag_wind_component_northward
        ts.Name='qc_flag_wind_component_northward';
        ts.Nctype='int';
        c=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Wind Component V';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=4;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%qc_flag_wind_component_upward
        ts.Name='qc_flag_wind_component_upward';
        ts.Nctype='int';
        c=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Wind Component W';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=4;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%qc_flag_backscatter
        ts.Name='qc_flag_backscatter';
        ts.Nctype='int';
        dc=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Backscatter';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=4;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%qc_flag_background_noise
        ts.Name='qc_flag_background_noise';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Background Noise';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=3;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 