function write_NC_variables_MRR_profiles(fn_nc, data, meta)
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
        clear ix
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
        ix=strfind(meta.l34,'m');
        x=str2num(meta.l34(1:ix-1));
        as(6).Name='valid_min';as(6).Value=min(data.H(1,:))+x;
        as(7).Name='valid_max';as(7).Value=max(data.H(1,:))+x;
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
%alt_time
        ts.Name='alt_time';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='seconds since 0000-01-01 00:00:00 UTC';
        as(2).Name='standard_name';as(2).Value='time';
        as(3).Name='long_name';as(3).Value='Time (seconds since 0000-01-01)';
        as(4).Name='valid_min';as(4).Value=min(data.ST);
        as(5).Name='valid_max';as(5).Value=max(data.ST);
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%day_of_year
        ts.Name='day_of_year';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value=['Day number from: ',num2str(data.DT(1,1)),'-01-01 00:00:00 UTC'];
        as(2).Name='long_name';as(2).Value='Day of Year';
        as(3).Name='valid_min';as(3).Value=min(data.DoY);
        as(4).Name='valid_max';as(4).Value=max(data.DoY);
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%year
        ts.Name='year';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Year';
        as(3).Name='valid_min';as(3).Value=min(data.DT(:,1));
        as(4).Name='valid_max';as(4).Value=max(data.DT(:,1));
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%month
        ts.Name='month';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Month';
        as(3).Name='valid_min';as(3).Value=min(data.DT(:,2));
        as(4).Name='valid_max';as(4).Value=max(data.DT(:,2));
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%day
        ts.Name='day';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Day';
        as(3).Name='valid_min';as(3).Value=min(data.DT(:,3));
        as(4).Name='valid_max';as(4).Value=max(data.DT(:,3));
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%hour
        ts.Name='hour';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Hour';
        as(3).Name='valid_min';as(3).Value=min(data.DT(:,4));
        as(4).Name='valid_max';as(4).Value=max(data.DT(:,4));
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%minute
        ts.Name='minute';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Minute';
        as(3).Name='valid_min';as(3).Value=min(data.DT(:,5));
        as(4).Name='valid_max';as(4).Value=max(data.DT(:,5));
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%second
        ts.Name='second';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Second';
        as(3).Name='valid_min';as(3).Value=min(data.DT(:,6));
        as(4).Name='valid_max';as(4).Value=max(data.DT(:,6));
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc            
%qc_flag
        ts.Name='qc_flag';
        ts.Nctype='int';
        dc=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Qulaity flag';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=7;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
        
%rainfall_rate
        ts.Name='rainfall_rate';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mm hr-1';
        as(2).Name='standard_name';as(2).Value='rainfall_rate';
        as(3).Name='long_name';as(3).Value='Rain Rate';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=0;
        as(6).Name='valid_max';as(6).Value=max(max(data.RR));
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%rain_liquid_water_content
        ts.Name='rain_liquid_water_content';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='g m-3';
        as(2).Name='long_name';as(2).Value='Rain Liquid Water Content';
        as(3).Name='_FillValue';as(3).Value=-1e+020;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=max(max(data.LWC));
        as(6).Name='cell_methods';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc     
%rain_fall_velocity
        ts.Name='rain_fall_velocity';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='Rain Fall Velocity';
        as(3).Name='_FillValue';as(3).Value=-1e+020;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=max(max(data.W));
        as(6).Name='cell_methods';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc      
%radar_reflectivity (Z)
        ts.Name='radar_reflectivity';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='dBZ';
        as(2).Name='long_name';as(2).Value='Radar Reflectivity';
        as(3).Name='_FillValue';as(3).Value=-1e+020;
        as(4).Name='valid_min';as(4).Value=min(min(data.Z));
        as(5).Name='valid_max';as(5).Value=max(max(data.Z));
        as(6).Name='cell_methods';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%attenuated_radar_reflectivity (z)
        ts.Name='attenuated_radar_reflectivity';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='dBZ';
        as(2).Name='long_name';as(2).Value='Attenuated Radar Reflectivity';
        as(3).Name='_FillValue';as(3).Value=-1e+020;
        as(4).Name='valid_min';as(4).Value=min(min(data.z));
        as(5).Name='valid_max';as(5).Value=max(max(data.z));
        as(6).Name='cell_methods';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc   
 %path_integrated_attenuation
        ts.Name='path_integrated_attenuation';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='dB';
        as(2).Name='long_name';as(2).Value='Path Integrated Attenuation';
        as(3).Name='_FillValue';as(3).Value=-1e+020;
        as(4).Name='valid_min';as(4).Value=min(min(data.PIA));
        as(5).Name='valid_max';as(5).Value=max(max(data.PIA));
        as(6).Name='cell_methods';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc         