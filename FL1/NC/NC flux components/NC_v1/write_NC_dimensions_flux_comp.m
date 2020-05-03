function write_NC_dimensions_flux_comp(fn_nc, meta, data)
[ri,tt]=size(data.fluxes.flux_runs.ET);
[~,LAT]=size(meta{length(meta)-2}); 
[~,LON]=size(meta{length(meta)-1}); 

%time
    nc_add_dimension(fn_nc,'time',ri);
%lataitude
    nc_add_dimension(fn_nc,'latitude',LAT);
%longitude
    nc_add_dimension(fn_nc,'longitude',LON);
%run_length
    nc_add_dimension(fn_nc,'run_length',tt);    
    