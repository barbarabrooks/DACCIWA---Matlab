function write_NC_dimensions_SONDES_v4(fn_nc, data)
[tt]=length(data.DoY);

%time
    nc_add_dimension(fn_nc,'time',tt);
    