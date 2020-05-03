function NC_HATPRO_MET_v3(dn,do,fn_meta)

%fn_meta='C:\Users\lecbjb\Desktop\Data Project\Stationary\ncas-scanning-radiometer-1\surface-met\Example META Data File\Meta data.csv';
% Wrapper to create NC files for hatpro
%input
%   dn: directory holding the matlab files
%   do: directory for nc files
%   fn_meta: full path to project meta file
%
%file name: <instrument_name>_<platform_name>_<YYYYMMDD>_<data_product>_v<version>.nc

%BB 24/06/2017
%fn_meta='E:\ACSE - radiometer\ACSE_meta_surface_met_v2.txt';
%dn='E:\ACSE - radiometer\matlab';
%do='E:\ACSE - radiometer\NC\V1';

%get meat data
meta = get_meta_v3(fn_meta);

%extract whats needed to create file name
[instrument_name,platform,data_product,version,scan_type] = NC_file_name_parts_v3(meta);

%get list of what is to be cnverted
list=dir(dn);

% run through list ad create nc files
for n=3:length(list)
    %get file time stamp assumes structure YYYYMMDD.mat
    temp=list(n).name;
    ix=strfind(temp,'.');
    timestamp=temp(1:ix-1);%timestamp
    clear temp
    
    %nc file name and path
    fc=fullfile (do,[instrument_name,'_',platform,'_',timestamp,'_',data_product,'_v',version,'.nc']);
    
    display(list(n).name)
    
    %load data file
    load(fullfile(dn,list(n).name));
    
    if ~isempty(data.MET)
        %Intemediate hatpro mat files contain all data in structure
        %data.MET, data.IWV, data.BRT,...
        %following two lines just extract the MET data and deletes the rest
        data1=data;clear data
        data=data1.MET;clear data1
        
        %create nc file, assumes NC_CLOBBER
        nc_create_empty(fc);
        %global attributes - generic function
        write_NC_header_v3(fc,meta,data); 
        %Dimensions - specific function
        write_NC_dimensions_HATPRO_MET_v3(fc,meta,data);        
        %Variables - General - generic function
        write_NC_variables_general_v3(fc,meta,data);
        %Variables - specific - specific function
        write_NC_variables_specific_HATPRO_MET_v3(fc);
        %Data  - specific function    
        write_NC_data_HATPRO_MET_v3(fc,meta,data);
    end
    clear fc temp ix f3 data data1
end
