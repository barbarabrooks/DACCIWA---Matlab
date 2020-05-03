function NC_HATPRO_BT_v2(dn,do,fn_meta)
%dn='F:\WORKING\Radiometer\matlab';
%do='F:\';
%fn_meta='C:\Users\lecbjb\Desktop\Data Project\Stationary\ncas-scanning-radiometer-1\brightness-temperature-profiles\Example META Data File\Meta data.csv';
% Wrapper to create NC files for pro
%input
%   dn: directory holding the matlab files
%   do: directory for nc files
%   fn_meta: full path to project meta file
%
% ncas-aws-<n>_<platform_name>_<YYYYMMDD>_<data_product>_<version>.nc
%BB 17/01/2017

% read meta file
meta=get_meta_v2(fn_meta);
%get filenaming information
f1=meta{1};%instrument name
f2=lower(meta{31}); %platform
f4=meta{2};%data product
f5=meta{3};%version

list=dir(dn);
for n=3:length(list)
    %get file time stamp
    temp=list(n).name;
    ix=strfind(temp,'.');
    f3=temp(1:ix-1);%timestamp
    clear temp
    %nc file name and path
    fc=fullfile (do,[f1,'_',f2,'_',f3,'_',f4,'_',f5,'.nc']);
    %load data file
    load(fullfile(dn,list(n).name));
    
    if ~isempty(data.BRT)
        data1=data;clear data
        data=data1.BRT;clear data1
        data.FREQ=[22.24 23.04 23.84 25.44 26.24 27.84 31.40 51.26 52.28 53.86 54.94 56.66 57.30 58.00].*1e9;
        
        %create nc file, assumes NC_CLOBBER
        nc_create_empty(fc);
        %global attributes
        write_NC_header_HATPRO_BT_v2(fc,meta,data);   
        %Dimensions
        write_NC_dimensions_HATPRO_BT_v2(fc,meta,data);        
        %Variables
        write_NC_variables_HATPRO_BT_v2(fc,data);
        %Data    
        write_NC_data_HATPRO_BT_v2(fc,meta,data);
    end
    %clear fc temp ix f3 data data1
end

end