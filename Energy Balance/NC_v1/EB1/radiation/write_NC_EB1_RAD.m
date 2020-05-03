function write_NC_EB1_RAD(fn_nc,fn_data,fn_meta)

%this converts the data to netcdf
%input
%   fn_nc: fullpath and filename to create nc file
%   fn_data: fullpath to datafile to be converted
%   fn_meat: full path and file name of projct meta file
%BB 23/06/2016

%fn_nc=fullfile(fn_nc);
load(fn_data);
% correction for dacciwa data
ix=find(data.RD.flag.Cleaning==5);
if ~isempty(ix)
    data.RD.flag.Cleaning(ix)=2;
end

meta=get_meta_EB1_RAD(fn_meta);

%create nc file, assumes NC_CLOBBER
    nc_create_empty(fn_nc);
%global attributes
    write_NC_header_EB1_RAD(fn_nc,meta,data);   
%Dimensions
    write_NC_dimensions_EB1_RAD(fn_nc,meta,data);        
%Variables
    write_NC_variables_EB1_RAD(fn_nc,data);
%Data    
    write_NC_data_EB1_RAD(fn_nc,meta,data);
    
end