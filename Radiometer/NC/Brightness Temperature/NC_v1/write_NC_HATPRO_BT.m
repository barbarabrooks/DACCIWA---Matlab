function write_NC_HATPRO_BT(fn_nc,fn_data,fn_meta)

%this converts the data to netcdf
%input
%   fn_nc: fullpath and filename to create nc file
%   fn_data: fullpath to datafile to be converted
%   fn_meat: full path and file name of projct meta file
%BB 23/06/2016

%fn_nc=fullfile(fn_nc);
display(fn_data)
load(fn_data);

if ~isempty(data.BRT)
    data1=data;clear data
    data=data1.BRT;clear data1
    data.FREQ=[22.24 23.04 23.84 25.44 26.24 27.84 31.40 51.26 52.28 53.86 54.94 56.66 57.30 58.00].*1e9;
    
    meta=get_meta_HATPRO_BT(fn_meta);

    %create nc file, assumes NC_CLOBBER
        nc_create_empty(fn_nc);
    %global attributes
        write_NC_header_HATPRO_BT(fn_nc,meta,data);   
    %Dimensions
        write_NC_dimensions_HATPRO_BT(fn_nc,meta,data);        
    %Variables
        write_NC_variables_HATPRO_BT(fn_nc,data);
    %Data    
        write_NC_data_HATPRO_BT(fn_nc,meta,data);   
end