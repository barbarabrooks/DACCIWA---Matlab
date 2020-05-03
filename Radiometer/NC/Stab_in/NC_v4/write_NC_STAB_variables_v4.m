function write_NC_STAB_variables_v4(fn_nc, data, offset)
%add prduct specific variables and data

%get rid of nans
ix = find(isnan(data.LI) == 1);
if ~isempty(data.LI)
    data.LI(ix) = -1e+020;
end
clear ix

ix = find(isnan(data.KOI) == 1);
if ~isempty(data.KOI)
    data.KOI(ix) = -1e+020;
end
clear ix

ix = find(isnan(data.TTI) == 1);
if ~isempty(data.TTI)
    data.TTI(ix) = -1e+020;
end
clear ix

ix = find(isnan(data.KI) == 1);
if ~isempty(data.KI)
    data.KI(ix) = -1e+020;
end
clear ix

ix = find(isnan(data.SI) == 1);
if ~isempty(data.SI)
    data.SI(ix) = -1e+020;
end
clear ix

ix = find(isnan(data.CAPE) == 1);
if ~isempty(data.CAPE)
    data.CAPE(ix) = -1e+020;
end
clear ix

%atmosphere_stability_lifted_index
    %define varibale
        ts.Name='atmosphere_stability_lifted_index';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='long_name';as(2).Value='Atmosphere Stability Lifted Index (LI)';
        as(3).Name='_FillValue';as(3).Value=-1e+020;
        as(4).Name='valid_min';as(4).Value=single(min(data.LI(find(data.LI > -1e+020))));
        as(5).Name='valid_max';as(5).Value=single(max(data.LI));
        as(6).Name='cell_methods';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'atmosphere_stability_lifted_index', single(data.LI));
        
%modified_atmosphere_stability_k_index
    %define varibale
        ts.Name='modified_atmosphere_stability_k_index';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='long_name';as(2).Value='Modified Atmosphere Stability K Index (KOI)';
        as(3).Name='_FillValue';as(3).Value=-1e+020;
        as(4).Name='valid_min';as(4).Value=single(min(data.KOI(find(data.KOI > -1e+020))));
        as(5).Name='valid_max';as(5).Value=single(max(data.KOI));
        as(6).Name='cell_methods';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'modified_atmosphere_stability_k_index', single(data.KOI));
        
%atmosphere_stability_total_totals_index
    %define varibale
        ts.Name='atmosphere_stability_total_totals_index';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='standard_name';as(2).Value='atmosphere_stability_total_totals_index';
        as(3).Name='long_name';as(3).Value='Atmosphere Stability Total Totals Index (TTI)';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=single(min(data.TTI(find(data.TTI > -1e+020))));
        as(6).Name='valid_max';as(6).Value=single(max(data.TTI));
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'atmosphere_stability_total_totals_index', single(data.TTI)); 
        
%atmosphere_stability_k_index
    %define varibale
        ts.Name='atmosphere_stability_k_index';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='standard_name';as(2).Value='atmosphere_stability_k_index';
        as(3).Name='long_name';as(3).Value='Atmosphere Stability K Index (KI)';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=single(min(data.KI(find(data.KI > -1e+020))));
        as(6).Name='valid_max';as(6).Value=single(max(data.KI));
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'atmosphere_stability_k_index', single(data.KI));     
        
%atmosphere_stability_showalter_index
    %define varibale
        ts.Name='atmosphere_stability_showalter_index';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='standard_name';as(2).Value='atmosphere_stability_showalter_index';
        as(3).Name='long_name';as(3).Value='Atmosphere Stability Showalter Index (SI)';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=single(min(data.SI(find(data.SI > -1e+020))));
        as(6).Name='valid_max';as(6).Value=single(max(data.SI));
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'atmosphere_stability_showalter_index', single(data.SI)); 
        
%atmosphere_convective_available_potential_energy
    %define varibale
        ts.Name='atmosphere_convective_available_potential_energy';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='J kg-1';
        as(2).Name='standard_name';as(2).Value='atmosphere_convective_available_potential_energy';
        as(3).Name='long_name';as(3).Value='Atmosphere Convective Available Potential Energy (CAPE)';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=single(min(data.CAPE(find(data.CAPE > -1e+020))));
        as(6).Name='valid_max';as(6).Value=single(max(data.CAPE));
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'atmosphere_convective_available_potential_energy', single(data.CAPE)); 
        
