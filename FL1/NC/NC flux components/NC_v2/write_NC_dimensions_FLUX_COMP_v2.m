function write_NC_dimensions_FLUX_COMP_v2(fn_nc, meta, data)
[ri,ii]=size(data.runs.DoY);
[~,LAT]=size(meta{length(meta)-2}); 
[~,LON]=size(meta{length(meta)-1}); 

%time
    nc_add_dimension(fn_nc,'time',ri);
%lataitude
    nc_add_dimension(fn_nc,'latitude',LAT);
%longitude
    nc_add_dimension(fn_nc,'longitude',LON);
%index
    nc_add_dimension(fn_nc,'index',ii);
    