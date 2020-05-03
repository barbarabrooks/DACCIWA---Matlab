function write_NC_dimensions_HATPRO_BT_v2(fn_nc, meta, data)
[tt,~]=size(data.ET);
[~,LAT]=size(meta{length(meta)-2}); 
[~,LON]=size(meta{length(meta)-1}); 
[ff]=length(data.FREQ);

%time
    nc_add_dimension(fn_nc,'time',tt);
%lataitude
    nc_add_dimension(fn_nc,'latitude',LAT);
%longitude
    nc_add_dimension(fn_nc,'longitude',LON);
%radiation_frequency
    nc_add_dimension(fn_nc,'radiation_frequency',ff);    
    