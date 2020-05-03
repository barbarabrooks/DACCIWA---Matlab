function write_NC_BRT_variables_v4(fn_nc, BRT, ATN, RHZ, offset)
%add prduct specific variables and data

%get rid of nans
ix = find(isnan(RHZ) == 1);
if ~isempty(RHZ)
    RHZ(ix) = -1e+020;
end
clear ix

ix = find(isnan(BRT) == 1);
if ~isempty(BRT)
    BRT(ix) = -1e+020;
end
clear ix

ix = find(isnan(ATN) == 1);
if ~isempty(ATN)
    ATN(ix) = -1e+020;
end
clear ix

%radiation_frequency
    %define varibale
        ts.Name='radiation_frequency';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='radiation_frequency';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='s-1';
        as(2).Name='standard_name';as(2).Value='radiation_frequency';
        as(3).Name='long_name';as(3).Value='Receiver Channel Centre Frequency.';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=single(min(RHZ(find(RHZ > -1e+020))));
        as(6).Name='valid_max';as(6).Value=single(max(RHZ));
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'radiation_frequency', single(RHZ));
        
%brightness_temperature
    %define varibale
        ts.Name='brightness_temperature';
        ts.Nctype='float32';
        dc=cell(1,2);dc{1}='time';dc{2}='radiation_frequency';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='standard_name';as(2).Value='brightness_temperature';
        as(3).Name='long_name';as(3).Value='Brightness Temperature';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=single(min(min(BRT(find(BRT> -1e+020)))));
        as(6).Name='valid_max';as(6).Value=single(max(max(BRT)));
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'brightness_temperature', single(BRT));
      
 %atmospheric_attenuation
    %define varibale
        ts.Name='atmospheric_attenuation';
        ts.Nctype='float32';
        dc=cell(1,2);dc{1}='time';dc{2}='radiation_frequency';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='dB';
        as(2).Name='long_name';as(2).Value='Atmospheric Attenuation';
        as(3).Name='_FillValue';as(3).Value=-1e+020;
        as(4).Name='valid_min';as(4).Value=single(min(min(ATN(find(ATN> -1e+020)))));
        as(5).Name='valid_max';as(5).Value=single(max(max(ATN)));
        as(6).Name='cell_methods';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'atmospheric_attenuation', single(ATN));
    