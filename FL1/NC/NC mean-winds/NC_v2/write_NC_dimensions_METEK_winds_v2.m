function write_NC_dimensions_METEK_winds_v2(fn_nc, meta, data)
[tt,~]=size(data.means.ET);
[~,LAT]=size(meta{length(meta)-2}); 
[~,LON]=size(meta{length(meta)-1});  

%time
    nc_add_dimension(fn_nc,'time',tt);
%lataitude
    nc_add_dimension(fn_nc,'latitude',LAT);
%longitude
    nc_add_dimension(fn_nc,'longitude',LON);
    