function write_NC_HATPRO_IWVLWP(fn_nc,fn_data,fn_meta)

%this converts the data to netcdf
%input
%   fn_nc: fullpath and filename to create nc file
%   fn_data: fullpath to datafile to be converted
%   fn_meat: full path and file name of projct meta file
%BB 23/06/2016

%fn_nc=fullfile(fn_nc);
display(fn_data)
load(fn_data);

if ~isempty(data.IWV)
    %Make data same length
    l1=length(data.IWV.IWV);l2=length(data.LWP.LWP);
    if l1>l2
        data1=data.IWV;
        data1.LWP=ones(size(data1.IWV)).*NaN;
        data1.LWP(1:length(data.LWP.LWP))=data.LWP.LWP;
    end
    if l2>l1
        data1=data.LWP;
        data1.IWV=ones(size(data1.LWP)).*NaN;
        data1.IWV(1:length(data.IWV.IWV))=data.IWV.IWV;
    end
    clear data
    data=data1;

    meta=get_meta_HATPRO_IWVLWP(fn_meta);

    %create nc file, assumes NC_CLOBBER
        nc_create_empty(fn_nc);
    %global attributes
        write_NC_header_HATPRO_IWVLWP(fn_nc,meta,data);   
    %Dimensions
        write_NC_dimensions_HATPRO_IWVLWP(fn_nc,meta,data);        
    %Variables
        write_NC_variables_HATPRO_IWVLWP(fn_nc,data);
    %Data    
        write_NC_data_HATPRO_IWVLWP(fn_nc,meta,data);   
end