function write_NC_variables_flux_comp(fn_nc, meta, data)
%time
        ts.Name='time';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='seconds since 1970-01-01 00:00:00 UTC';
        as(2).Name='standard_name';as(2).Value='time';
        as(3).Name='long_name';as(3).Value='End of run (seconds since 1970-01-01)';
        as(4).Name='axis';as(4).Value='T';
        ix=find(~isnan(data.fluxes.flux_runs.ET(1,:)));
        as(5).Name='valid_min';as(5).Value=min(data.fluxes.flux_runs.ET(1,ix(end)));clear ix
        ix=find(~isnan(data.fluxes.flux_runs.ET(end,:)));
        as(6).Name='valid_max';as(6).Value=max(data.fluxes.flux_runs.ET(end,ix(end)));clear ix
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
%run_time_ET
        ts.Name='run_time_ET';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='seconds since 1970-01-01 00:00:00 UTC';
        as(2).Name='long_name';as(2).Value='Run Time (seconds since 1970-01-01)';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%run_start_time_ET
        ts.Name='run_start_time_ET';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='seconds since 1970-01-01 00:00:00 UTC';
        as(2).Name='long_name';as(2).Value='Start of run (seconds since 1970-01-01)';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%licor_temperature
        ts.Name='air_temperature';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='long_name';as(2).Value='Licor temperature (T)';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc   
%surface_air_pressure
        ts.Name='surface_air_pressure';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='Pa';
        as(2).Name='long_name';as(2).Value='Licor Pressure';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc          
%licor_dew_point_temperatrue
        ts.Name='dew_point_temperature';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='long_name';as(2).Value='Licor Dew Point Temperature';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%mole_concentration_of_carbon_dioxide_in_air
        ts.Name='mole_concentration_of_carbon_dioxide_in_air';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mol m-3';
        as(2).Name='long_name';as(2).Value='CO2 number concentration';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc       
%mole_concentration_of_water_vapor_in_air
        ts.Name='mole_concentration_of_water_vapor_in_air';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mol m-3';
        as(2).Name='long_name';as(2).Value='Water Vapour number concentration';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc          
%Sonic_temperature
        ts.Name='sonic_air_temperature';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='long_name';as(2).Value='Sonic temperature (Ts) corrected for sidewind';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
%Sonic_u_earth
        ts.Name='sonic_u_earth';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='U component (earth frame) ';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%Sonic_v_earth
        ts.Name='sonic_v_earth';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='V component (earth frame) ';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%Sonic_w_earth
        ts.Name='sonic_w_earth';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='W component (earth frame) ';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%Sonic_u_run
        ts.Name='sonic_u_run';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='U component (rotated to run) ';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%Sonic_v_run
        ts.Name='sonic_v_run';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='V component (rotated to run) ';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%Sonic_w_run
        ts.Name='sonic_w_run';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='W component (rotated to run) ';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%skew_u       
        ts.Name='skew_u';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='skew u';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%skew_w       
        ts.Name='skew_v';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='skew v';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%skew_w       
        ts.Name='skew_w';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='skew w';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%skew_Ts       
        ts.Name='skew_Ts';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='skew corrected sonic temperature';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc         
%kurtosis_u       
        ts.Name='kurtosis_u';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='kurtosis u';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%kurtosis_v       
        ts.Name='kurtosis_v';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='kurtosis v';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%kurtosis_w       
        ts.Name='kurtosis_w';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='kurtosis w';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%kurtosis_Ts       
        ts.Name='kurtosis_Ts';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='kurtosis corrected sonic temperature';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%sst_wu       
        ts.Name='sst_wu';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='steady state test result wu';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%sst_wv       
        ts.Name='sst_wv';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='steady state test result wv';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%sst_wt       
        ts.Name='sst_wt';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='steady state test result wt';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc       
%friction_velocity       
        ts.Name='friction_velocity';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='u*';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%obukhov_length      
        ts.Name='obukhov_length';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m';
        as(2).Name='long_name';as(2).Value='L';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%stability_parameter      
        ts.Name='stability_parameter';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Z/L';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc      
%sigma_w       
        ts.Name='sigma_w';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='std of w';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%itc_w      
        ts.Name='itc_w';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='integral turbulent charecteristic of w';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%qc_flag_skew_u      
        ts.Name='qc_flag_skew_u';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: skew u';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc      
%qc_flag_skew_v      
        ts.Name='qc_flag_skew_v';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: skew v';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%qc_flag_skew_w      
        ts.Name='qc_flag_skew_w';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: skew w';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%qc_flag_skew_Ts      
        ts.Name='qc_flag_skew_Ts';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: skew corrected sonic temperature';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc      
%qc_flag_kurtosis_u      
        ts.Name='qc_flag_kurtosis_u';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: kurtosis u';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc      
%qc_flag_kurtosis_v      
        ts.Name='qc_flag_kurtosis_v';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: kurtosis v';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%qc_flag_kurtosis_w      
        ts.Name='qc_flag_kurtosis_w';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: kurtosis w';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%qc_flag_kurtosis_Ts      
        ts.Name='qc_flag_kurtosis_Ts';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: kurtosis corrected sonic temperature';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%qc_flag_sstclass_wu      
        ts.Name='qc_flag_sstclass_wu';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: steady state class wu';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
%qc_flag_sstclass_wv      
        ts.Name='qc_flag_sstclass_wv';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: steady state class wv';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%qc_flag_sstclass_wt      
        ts.Name='qc_flag_sstclass_wt';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: steady state class wt';
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
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%qc_flag_quality_wt      
        ts.Name='qc_flag_quality_wt';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: quality wt';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc         
%qc_flag_itc_class      
        ts.Name='qc_flag_itc_class';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Quality flag: integral turbulent charecteristic of w class';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%uBar      
        ts.Name='uBar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='<u>';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc      
%vBar      
        ts.Name='vBar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='<v>';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%wBar      
        ts.Name='wBar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='<w>';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%TsBar      
        ts.Name='TsBar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='<sonic Temperature>';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%CO2Bar      
        ts.Name='CO2Bar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mol m-3';
        as(2).Name='long_name';as(2).Value='<CO2>';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%H2OBar      
        ts.Name='H2OBar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mol m-3';
        as(2).Name='long_name';as(2).Value='<H2O>';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%uPrime      
        ts.Name='uPrime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value=['u',char(39)];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%vPrime      
        ts.Name='vPrime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value=['v',char(39)];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
%wPrime      
        ts.Name='wPrime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value=['w',char(39)];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%TsPrime      
        ts.Name='TsPrime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='long_name';as(2).Value=['Ts',char(39)];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
%CO2Prime      
        ts.Name='CO2Prime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='long_name';as(2).Value=['CO2',char(39)];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%H2OPrime      
        ts.Name='H2OPrime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='long_name';as(2).Value=['H2O',char(39)];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%wPrimeuPrime      
        ts.Name='wPrimeuPrime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['w',char(39),'u',char(39)];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%wPrimevPrime      
        ts.Name='wPrimevPrime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['w',char(39),'v',char(39)];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%wPrimewPrime      
        ts.Name='wPrimewPrime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['w',char(39),'w',char(39)];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%uPrimeuPrime      
        ts.Name='uPrimeuPrime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['u',char(39),'u',char(39)];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%vPrimevPrime      
        ts.Name='vPrimevPrime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['v',char(39),'v',char(39)];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%wPrimeTsPrime      
        ts.Name='wPrimeTsPrime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K m s-1';
        as(2).Name='long_name';as(2).Value=['w',char(39),'Ts',char(39)];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%wPrimeCO2Prime      
        ts.Name='wPrimeCO2Prime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mol m-2 s-1';
        as(2).Name='long_name';as(2).Value=['w',char(39),'CO2',char(39)];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc   
%wPrimeH2OPrime      
        ts.Name='wPrimeH2OPrime';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='run_length';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mol m-2 s-1';
        as(2).Name='long_name';as(2).Value=['w',char(39),'H2O2',char(39)];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%wPrimeuPrimeBar      
        ts.Name='wPrimeuPrimeBar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['<w',char(39),'u',char(39),'>'];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%wPrimevPrimeBar      
        ts.Name='wPrimevPrimeBar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['<w',char(39),'v',char(39),'>'];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%wPrimewPrimeBar      
        ts.Name='wPrimewPrimeBar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['<w',char(39),'w',char(39),'>'];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%uPrimeuPrimeBar      
        ts.Name='uPrimeuPrimeBar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['<u',char(39),'u',char(39),'>'];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%vPrimevPrimeBar      
        ts.Name='vPrimevPrimeBar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m2 s-2';
        as(2).Name='long_name';as(2).Value=['<v',char(39),'v',char(39),'>'];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%wPrimeTsPrimeBar      
        ts.Name='wPrimeTsPrimeBar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K m s-1';
        as(2).Name='long_name';as(2).Value=['<w',char(39),'Ts',char(39),'>'];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%wPrimeCO2PrimeBar      
        ts.Name='wPrimeCO2PrimeBar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mol m-2 s-1';
        as(2).Name='long_name';as(2).Value=['<w',char(39),'CO2',char(39),'>'];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc   
 %wPrimeH2OPrimeBar      
        ts.Name='wPrimeH2OPrimeBar';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mol m-2 s-1';
        as(2).Name='long_name';as(2).Value=['<w',char(39),'H2O2',char(39),'>'];
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc         
        