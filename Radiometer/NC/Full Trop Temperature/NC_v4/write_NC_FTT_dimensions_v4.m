function write_NC_FTT_dimensions_v4(length_index, fn_nc)
%add product specific dimensions

%index
    nc_add_dimension(fn_nc,'index',length_index);