function write_NC_dimensions_MRR_conc(fn_nc, data, meta)
[tt,ii,zz]=size(data.F);
[junk,LAT]=size(meta.LAT); 
[junk,LON]=size(meta.LON); 

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