function write_NC_BRT_dimensions_v4(length_index, fn_nc)
%add product specific dimensions

%radiation_frequency
    nc_add_dimension(fn_nc,'radiation_frequency',length_index);