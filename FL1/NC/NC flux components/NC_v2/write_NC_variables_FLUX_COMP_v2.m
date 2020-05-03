function write_NC_variables_FLUX_COMP_v2(fn_nc, data)
%time
        ts.Name='time';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='seconds since 1970-01-01 00:00:00 UTC';
        as(2).Name='standard_name';as(2).Value='time';
        as(3).Name='long_name';as(3).Value='End of run (seconds since 1970-01-01)';
        as(4).Name='axis';as(4).Value='T';
        as(5).Name='valid_min';as(5).Value=data.runs.end_of_run_ET(1);
        as(6).Name='valid_max';as(6).Value=data.runs.end_of_run_ET(end);
        as(7).Name='calendar';as(7).Value='julian';
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
        as(2).Name='long_name';as(2).Value='End of run (Day of Year)';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=366;
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%year
        ts.Name='year';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='End of run (Year)';
        as(3).Name='valid_min';as(3).Value=1900;
        as(4).Name='valid_max';as(4).Value=2100;
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%month
        ts.Name='month';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='End of run (Month)';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=12;
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%day
        ts.Name='day';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='End of run (Day)';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=31;
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%hour
        ts.Name='hour';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='End of run (Hour)';
        as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=23;
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%minute
        ts.Name='minute';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='End of run (Minute)';
        as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=59;
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%second
        ts.Name='second';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='End of run (Second)';
        as(3).Name='valid_min';as(3).Value=0.0000;
        as(4).Name='valid_max';as(4).Value=59.9999;
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc           
%start_of_run
        ts.Name='start_of_run';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='seconds since 1970-01-01 00:00:00 UTC';
        as(2).Name='long_name';as(2).Value='Start of run (seconds since 1970-01-01)';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=data.runs.start_of_run_ET(1);
        as(5).Name='valid_max';as(5).Value=data.runs.start_of_run_ET(end);
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc       
%run_length
        ts.Name='run_length';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='s';
        as(2).Name='long_name';as(2).Value='Length of run (Seconds)';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=1800;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc   
%number_of_samples_in_run
        ts.Name='number_of_samples_in_run';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Number of samples in run';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=40000;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc      
%licor_temperature
        ts.Name='air_temperature';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='long_name';as(2).Value='Licor temperature (T)';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=248.15;
        as(5).Name='valid_max';as(5).Value=323.15;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc          
%air_pressure
        ts.Name='air_pressure';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='hPa';
        as(2).Name='long_name';as(2).Value='Licor Pressure';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=650;
        as(5).Name='valid_max';as(5).Value=1150;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc                   
%mole_concentration_of_carbon_dioxide_in_air
        ts.Name='mole_concentration_of_carbon_dioxide_in_air';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mmol m-3';
        as(2).Name='standard_name';as(2).Value='mole_concentration_of_carbon_dioxide_in_air';
        as(3).Name='long_name';as(3).Value='CO2 number concentration';
        as(4).Name='_FillValue';as(4).Value=-1E20;
        as(5).Name='valid_min';as(5).Value=0;
        as(6).Name='valid_max';as(6).Value=100;
        as(7).Name='cell_method';as(7).Value='time: point';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc               
%mole_concentration_of_water_vapor_in_air
        ts.Name='mole_concentration_of_water_vapor_in_air';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mmol m-3';
        as(2).Name='standard_name';as(2).Value='mole_concentration_of_water_vapor_in_air';
        as(3).Name='long_name';as(3).Value='H2O number concentration';
        as(4).Name='_FillValue';as(4).Value=-1E20;
        as(5).Name='valid_min';as(5).Value=0;
        as(6).Name='valid_max';as(6).Value=2000;
        as(7).Name='cell_method';as(7).Value='time: point';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc           
%specific_humidity
        ts.Name='specific humdidity';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='kg kg-1';
        as(2).Name='long_name';as(2).Value='Specific humidity (Q)';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=1;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%water_vapour_partial_pressure
        ts.Name='water_vapour_partial_pressure';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='Pa';
        as(2).Name='long_name';as(2).Value='Water Vapuour Partail Pressure (PPwet)';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=1e4;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc         
%water_vapour_mass_mixing_ratio
        ts.Name='water_vapour_mass_mixing_ratio';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Water Vapour Mass Mixing Ratio (WVMRR)';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=1;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
%Sonic_temperature_Q
        ts.Name='sonic_air_temperature_Q_corrected';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='long_name';as(2).Value='Sonic temperature (Ts) corrected for sidewind and humidity (Theta)';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=243.15;
        as(5).Name='valid_max';as(5).Value=423.15;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc         
%Sonic_u_earth
        ts.Name='sonic_u_earth';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='U component (earth frame) ';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-50;
        as(5).Name='valid_max';as(5).Value=50;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc       
%Sonic_v_earth
        ts.Name='sonic_v_earth';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='V component (earth frame) ';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-50;
        as(5).Name='valid_max';as(5).Value=50;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%Sonic_w_earth
        ts.Name='sonic_w_earth';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='W component (earth frame) ';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-50;
        as(5).Name='valid_max';as(5).Value=50;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%Sonic_u_run
        ts.Name='sonic_u_run';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='U component (rotated to run) ';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-50;
        as(5).Name='valid_max';as(5).Value=50;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%Sonic_v_run
        ts.Name='sonic_v_run';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='V component (rotated to run) ';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-50;
        as(5).Name='valid_max';as(5).Value=50;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%Sonic_w_run
        ts.Name='sonic_w_run';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='W component (rotated to run) ';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-50;
        as(5).Name='valid_max';as(5).Value=50;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%Sonic_temperature
        ts.Name='sonic_air_temperature';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='long_name';as(2).Value='Sonic temperature (Ts)';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=243.15;
        as(5).Name='valid_max';as(5).Value=323.15;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc         
%skew_u       
        ts.Name='skew_u';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='skew u';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-2;
        as(5).Name='valid_max';as(5).Value=2;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%skew_w       
        ts.Name='skew_v';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='skew v';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-2;
        as(5).Name='valid_max';as(5).Value=2;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%skew_w       
        ts.Name='skew_w';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='skew w';
       as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-2;
        as(5).Name='valid_max';as(5).Value=2;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%skew_Ts       
        ts.Name='skew_ts';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='skew corrected sonic temperature';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-2;
        as(5).Name='valid_max';as(5).Value=2;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc         
%kurtosis_u       
        ts.Name='kurtosis_u';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='kurtosis u';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=8;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%kurtosis_v       
        ts.Name='kurtosis_v';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='kurtosis v';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=8;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%kurtosis_w       
        ts.Name='kurtosis_w';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='kurtosis w';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=8;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%kurtosis_Ts       
        ts.Name='kurtosis_ts';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='kurtosis corrected sonic temperature';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=8;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%sst_wu       
        ts.Name='sst_wu';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='steady state test result wu';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=1000;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc     
%sst_wv       
        ts.Name='sst_wv';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='steady state test result wv';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=1000;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%sst_wts       
        ts.Name='sst_wts';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='steady state test result wt';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=1000;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc       
%friction_velocity       
        ts.Name='friction_velocity';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='u*';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%obukhov_length      
        ts.Name='obukhov_length';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m';
        as(2).Name='long_name';as(2).Value='L';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-5000;
        as(5).Name='valid_max';as(5).Value=5000;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%stability_parameter      
        ts.Name='stability_parameter';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Z/L';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-1;
        as(5).Name='valid_max';as(5).Value=1;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc          
%sigma_w       
        ts.Name='sigma_w';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='std of w';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-10;
        as(5).Name='valid_max';as(5).Value=10;
        as(6).Name='cell_method';as(6).Value='time: standard_deviation';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%itc_w      
        ts.Name='itc_w';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='integral turbulent charecteristic of w';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=1000;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%qc_flag_skew_u      
        ts.Name='qc_flag_skew_u';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: skew u';
        as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=2;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc      
%qc_flag_skew_v      
        ts.Name='qc_flag_skew_v';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: skew v';
         as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=2;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%qc_flag_skew_w      
        ts.Name='qc_flag_skew_w';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: skew w';
         as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=2;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%qc_flag_skew_ts      
        ts.Name='qc_flag_skew_ts';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: skew corrected sonic temperature';
         as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=2;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc   
%qc_flag_kurtosis_u      
        ts.Name='qc_flag_kurtosis_u';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: kurtosis u';
        as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=2;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc   
%qc_flag_kurtosis_v      
        ts.Name='qc_flag_kurtosis_v';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: kurtosis v';
        as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=2;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%qc_flag_kurtosis_w      
        ts.Name='qc_flag_kurtosis_w';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: kurtosis w';
        as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=2;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%qc_flag_kurtosis_Ts      
        ts.Name='qc_flag_kurtosis_ts';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: kurtosis corrected sonic temperature';
        as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=2;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%qc_flag_sstclass_wu      
        ts.Name='qc_flag_sstclass_wu';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: steady state class wu';
         as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=9;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
%qc_flag_sstclass_wv      
        ts.Name='qc_flag_sstclass_wv';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: steady state class wv';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=9;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%qc_flag_sstclass_wts      
        ts.Name='qc_flag_sstclass_wts';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: steady state class wts';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=9;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc         
%qc_flag_quality_wu      
        ts.Name='qc_flag_quality_wu';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: wu';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
%qc_flag_quality_wv      
        ts.Name='qc_flag_quality_wv';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: wv';
         as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=3;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%qc_flag_quality_wts      
        ts.Name='qc_flag_quality_wts';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: quality wts';
         as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=3;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
%qc_flag_itc_class      
        ts.Name='qc_flag_itc_class';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: integral turbulent charecteristic of w class';
         as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=3;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%uBar      
        ts.Name='ubar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='<u>';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-50;
        as(5).Name='valid_max';as(5).Value=50;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc            
%vBar      
        ts.Name='vbar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='<v>';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-50;
        as(5).Name='valid_max';as(5).Value=50;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc            
%wBar      
        ts.Name='wbar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='<w>';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-50;
        as(5).Name='valid_max';as(5).Value=50;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc            
%TsBar      
        ts.Name='tsbar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='long_name';as(2).Value='<Sonic Temperature>';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=243.15;
        as(5).Name='valid_max';as(5).Value=323.15;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc            
%CO2Bar      
        ts.Name='co2bar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mmol m-3';
        as(2).Name='long_name';as(2).Value='<CO2>';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc               
%H2OBar      
        ts.Name='h2obar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mmol m-3';
        as(2).Name='long_name';as(2).Value='<H2O>';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=2000;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc   
%QBar      
        ts.Name='qbar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='kg kg-1';
        as(2).Name='long_name';as(2).Value='<Q>';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=1;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%ThetaBar      
        ts.Name='thetabar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='long_name';as(2).Value='<Theta (Humidity Corrected Sonic Temperature)>';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=243.15;
        as(5).Name='valid_max';as(5).Value=434.15;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc      
%WVMMRBar      
        ts.Name='wvmmrbar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='<WVMMR>';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=1;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc          
        
%uPrime      
        ts.Name='uprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value=['u',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-10;
        as(5).Name='valid_max';as(5).Value=10;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc                
%vPrime      
        ts.Name='vprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value=['v',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-10;
        as(5).Name='valid_max';as(5).Value=10;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc          
%wPrime      
        ts.Name='wprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value=['w',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-10;
        as(5).Name='valid_max';as(5).Value=10;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%TsPrime      
        ts.Name='tsprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='long_name';as(2).Value=['Ts',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-10;
        as(5).Name='valid_max';as(5).Value=10;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
%CO2Prime      
        ts.Name='co2prime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mmol m-3';
        as(2).Name='long_name';as(2).Value=['CO2',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-10;
        as(5).Name='valid_max';as(5).Value=10;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc   
%H2OPrime      
        ts.Name='h2oprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mmol m-3';
        as(2).Name='long_name';as(2).Value=['H2O',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-10;
        as(5).Name='valid_max';as(5).Value=10;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc   
%QPrime      
        ts.Name='qprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='kg kg-1';
        as(2).Name='long_name';as(2).Value=['Q',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-10;
        as(5).Name='valid_max';as(5).Value=10;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc         
%thetaPrime      
        ts.Name='thetaprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='long_name';as(2).Value=['Theta',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-10;
        as(5).Name='valid_max';as(5).Value=10;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%WVMMRPrime      
        ts.Name='wvmmrprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='kg kg-1';
        as(2).Name='long_name';as(2).Value=['WVMMR',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-10;
        as(5).Name='valid_max';as(5).Value=10;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%wPrimeuPrime      
        ts.Name='wprimeuprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['w',char(39),'u',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc     
%wPrimevPrime      
        ts.Name='wprimevprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['w',char(39),'v',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc     
%wPrimewPrime      
        ts.Name='wprimewprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['w',char(39),'w',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc      
%uPrimeuPrime      
        ts.Name='uprimeuprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['u',char(39),'u',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc      
%vPrimevPrime      
        ts.Name='vprimevprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['v',char(39),'v',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc     
%wPrimeTsPrime      
        ts.Name='wprimetsprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K m s-1';
        as(2).Name='long_name';as(2).Value=['w',char(39),'Ts',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc     
%wPrimeCO2Prime      
        ts.Name='wprimeco2prime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mmol m-2 s-1';
        as(2).Name='long_name';as(2).Value=['w',char(39),'CO2',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc       
%wPrimeH2OPrime      
        ts.Name='wprimeh2oprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mmol m-2 s-1';
        as(2).Name='long_name';as(2).Value=['w',char(39),'H2O',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc   
%wPrimeQPrime      
        ts.Name='wprimeqprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='kg kg-1 m s-1';
        as(2).Name='long_name';as(2).Value=['w',char(39),'Q',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
%wPrimeThetaPrime      
        ts.Name='wprimethetaprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K m s-1';
        as(2).Name='long_name';as(2).Value=['w',char(39),'Theta',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%wPrimeWVMMRPrime      
        ts.Name='wprimewvmmrprime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value=['w',char(39),'WVMMR',char(39)];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc           
%wPrimeuPrimeBar      
        ts.Name='wprimeuprimebar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['<w',char(39),'u',char(39),'>'];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc         
%wPrimevPrimeBar      
        ts.Name='wprimevprimebar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['<w',char(39),'v',char(39),'>'];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc     
%wPrimewPrimeBar      
        ts.Name='wprimewprimebar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['<w',char(39),'w',char(39),'>'];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
                
%uPrimeuPrimeBar      
        ts.Name='uprimeuprimebar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['<u',char(39),'u',char(39),'>'];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc     
%vPrimevPrimeBar      
        ts.Name='vprimevprimebar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['<v',char(39),'v',char(39),'>'];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc     
%wPrimeTsPrimeBar      
        ts.Name='wprimetsprimebar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K m s-1';
        as(2).Name='long_name';as(2).Value=['<w',char(39),'Ts',char(39),'>'];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc     
%wPrimeCO2PrimeBar      
        ts.Name='wprimeco2primebar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mmol m-2 s-1';
        as(2).Name='long_name';as(2).Value=['<w',char(39),'CO2',char(39),'>'];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc      
%wPrimeH2OPrimeBar      
        ts.Name='wprimeh2oprimebar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mmol m-2 s-1';
        as(2).Name='long_name';as(2).Value=['<w',char(39),'H2O',char(39),'>'];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc            
%wPrimeQPrimeBar      
        ts.Name='wprimeqprimebar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='kg kg-1 m s-1';
        as(2).Name='long_name';as(2).Value=['<w',char(39),'Q',char(39),'>'];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc   
%wPrimeThetaPrimeBar      
        ts.Name='wprimethetaprimebar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K m s-1';
        as(2).Name='long_name';as(2).Value=['<w',char(39),'Theta',char(39),'>'];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
 %wPrimeWVMMRPrimeBar      
        ts.Name='wprimewvmmrprimebar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value=['<w',char(39),'WVMMR',char(39),'>'];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc      
        