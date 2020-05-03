function write_NC_dimensions_MRR_conc_v2(fn_nc, meta, data)
[tt,ii,zz]=size(data.F);
[~,LAT]=size(meta{length(meta)-2}); 
[~,LON]=size(meta{length(meta)-1}); 

%time
    nc_add_dimension(fn_nc,'time',tt);
%altitude
    nc_add_dimension(fn_nc,'altitude',zz);
%lataitude
    nc_add_dimension(fn_nc,'latitude',LAT);
%longitude
    nc_add_dimension(fn_nc,'longitude',LON);
%index
    nc_add_dimension(fn_nc,'spectral_bin',ii);