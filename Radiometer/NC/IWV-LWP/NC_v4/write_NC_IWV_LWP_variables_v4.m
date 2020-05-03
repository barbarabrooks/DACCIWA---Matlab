function write_NC_IWV_LWP_variables_v4(fn_nc, IWV, LWP, offset)
%add prduct specific variables and data

%get rid of nans
ix = find(isnan(IWV) == 1);
if ~isempty(IWV)
    IWV(ix) = -1e+020;
end
clear ix

ix = find(isnan(LWP) == 1);
if ~isempty(LWP)
    LWP(ix) = -1e+020;
end
clear ix

%integrated_water_vapour
    %define varibale
        ts.Name='integrated_water_vapour';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='kg m-2';
        as(2).Name='long_name';as(2).Value='Integrated Water Vapour)';
        as(3).Name='_FillValue';as(3).Value=-1e+020;
        as(4).Name='valid_min';as(4).Value=single(min(IWV(find(IWV > -1e+020))));
        as(5).Name='valid_max';as(5).Value=single(max(IWV));
        as(6).Name='cell_methods';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'integrated_water_vapour', single(IWV));
        
%liquid_water_path
    %define varibale
        ts.Name='liquid_water_path';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='g m-2';
        as(2).Name='long_name';as(2).Value='Liquid Water Path)';
        as(3).Name='_FillValue';as(3).Value=-1e+020;
        as(4).Name='valid_min';as(4).Value=single(min(LWP(find(LWP > -1e+020))));
        as(5).Name='valid_max';as(5).Value=single(max(LWP));
        as(6).Name='cell_methods';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'liquid_water_path', single(LWP));        
        