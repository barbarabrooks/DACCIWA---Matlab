function write_NC_dimensions_EB1_RAD(fn_nc, meta, data)
[tt,zz]=size(data.RD.ET);
[junk,LAT]=size(meta{length(meta)-2}); 
[junk,LON]=size(meta{length(meta)-1}); 

%time
    nc_add_dimension(fn_nc,'time',tt);
%lataitude
    nc_add_dimension(fn_nc,'latitude',LAT);
%longitude
    nc_add_dimension(fn_nc,'longitude',LON);
    