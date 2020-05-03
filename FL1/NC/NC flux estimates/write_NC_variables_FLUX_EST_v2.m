function write_NC_variables_FLUX_EST_v2(fn_nc, data)
%time
        ts.Name='time';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='seconds since 1970-01-01 00:00:00 UTC';
        as(2).Name='standard_name';as(2).Value='time';
        as(3).Name='long_name';as(3).Value='End of run (seconds since 1970-01-01)';
        as(4).Name='axis';as(4).Value='T';
        as(5).Name='valid_min';as(5).Value=min(data.runs.end_of_run_ET);
        as(6).Name='valid_max';as(6).Value=max(data.runs.end_of_run_ET);
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
        as(4).Name='valid_min';as(4).Value=min(data.runs.start_of_run_ET);
        as(5).Name='valid_max';as(5).Value=max(data.runs.start_of_run_ET);
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
        
%bouyancy flux
        ts.Name='bouyancy_flux';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='J m-2 s-1';
        as(2).Name='long_name';as(2).Value=['Bouyancy Flux (rho.cp.<W',char(39),'Ts',char(39),'>)'];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-1000;
        as(5).Name='valid_max';as(5).Value=1000;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%kinematic humidity flux
        ts.Name='kinematic_humidity_flux';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='kg kg-1 m s-1';
        as(2).Name='long_name';as(2).Value=['Kinematic Humidity Flux (<W',char(39),'Q',char(39),'>)'];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-10;
        as(5).Name='valid_max';as(5).Value=10;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%kinematic sonic temperature flux
        ts.Name='kinematic_sonic_temperature_flux';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K m s-1';
        as(2).Name='long_name';as(2).Value=['Kinematic Sonic Temperature Flux (<W',char(39),'Ts',char(39),'>)'];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc         
%upward_sensible_heat_flux_in_air
        ts.Name='upward_sensible_heat_flux_in_air';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='W m-2';
        as(2).Name='standard_name';as(2).Value='upward_sensible_heat_flux_in_air';
        as(3).Name='long_name';as(3).Value='Sensible Heat Flux';
        as(4).Name='_FillValue';as(4).Value=-1E20;
        as(5).Name='valid_min';as(5).Value=-1000;
        as(6).Name='valid_max';as(6).Value=1000;
        as(7).Name='cell_method';as(7).Value='time: point';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%upward_latent_heat_flux_in_air
        ts.Name='upward_latent_heat_flux_in_air';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='W m-2';
        as(2).Name='standard_name';as(2).Value='upward_latent_heat_flux_in_air';
        as(3).Name='long_name';as(3).Value='Latent Heat Flux';
        as(4).Name='_FillValue';as(4).Value=-1E20;
        as(5).Name='valid_min';as(5).Value=-1000;
        as(6).Name='valid_max';as(6).Value=1000;
        as(7).Name='cell_method';as(7).Value='time: point';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc         
%momentum_flux_u
        ts.Name='momentum_flux_u';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='kg m-1 s-2';
        as(2).Name='long_name';as(2).Value=['Momentum Flux: U (-rho.<W',char(39),'U',char(39),'>)'];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-1000;
        as(5).Name='valid_max';as(5).Value=1000;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc          
%momentum_flux_v
        ts.Name='momentum_flux_v';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='kg m-1 s-2';
        as(2).Name='long_name';as(2).Value=['Momentum Flux: V (-rho.<W',char(39),'V',char(39),'>)'];
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-1000;
        as(5).Name='valid_max';as(5).Value=1000;
        as(6).Name='cell_method';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
%bowen_ratio
        ts.Name='bowen_ratio';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Bowen Ratio (sensible\latent)';
        as(3).Name='_FillValue';as(3).Value=-1E20;
        as(4).Name='valid_min';as(4).Value=-100;
        as(5).Name='valid_max';as(5).Value=100;
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