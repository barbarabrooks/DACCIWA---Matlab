function NC_SONDES_v4(dn,do,fn_meta)
%dn='G:\renfrew\sonde\matlab';
%do='G:\renfrew\sonde\nc';
%fn_meta='G:\renfrew\sonde\meta.txt';

% Wrapper to create NC files for pro
%input
%   dn: directory holding the matlab files
%   do: directory for nc files
%   fn_meta: full path to project meta file
%
% ncas-aws-<n>_<platform_name>_<YYYYMMDD>_<data_product>_<version>.nc
%BB 17/01/2017

%get meta data
meta = get_meta_v4(fn_meta);

%extract whats needed to create file name
instrument_name = 'ncas-radiosonde-2'; 
data_product = 'sonde';
version = '0.1';
platform = 'alliance';
%get list of what is to be cnverted
list=dir(dn);

for n=3:length(list)
    load(fullfile(dn,list(n).name));
    [JD, ~, ET]=file_times(data.DT');data.ET=ET';
    data.DoY=JD';
    
    YYYY = num2str(data.DT(1,1));
    MM = num2str(data.DT(1,2));
    if length(MM)< 2
        MM=['0',MM];
    end
    DD = num2str(data.DT(1,3));
    if length(DD)< 2
        DD=['0',DD];
    end
    HH = num2str(data.DT(1,4));
    if length(HH)< 2
        HH=['0',HH];
    end
    mm = num2str(data.DT(1,5));
    if length(mm)< 2
        mm=['0',mm];
    end
    SS = num2str(data.DT(1,6));
    if length(SS)< 2
        SS=['0',SS];
    end
    timestamp = [YYYY,MM,DD,'-',HH,mm,SS];
    
    %nc file name and path
    fc=fullfile (do,[instrument_name,'_',platform,'_',timestamp,'_',data_product,'_v',version,'.nc']);
    display(list(n).name)
    
    %create nc file, assumes NC_CLOBBER
    nc_create_empty(fc);
    %global attributes
    write_NC_header_v4(fc,meta,data);   
    %Dimensions
    write_NC_dimensions_SONDES_v4(fc,data);
    %Variables
    write_NC_variables_v4(fc,data);
    %Data    
    write_NC_data_SONDES_v4(fc,data);
    
    clear fc temp ix f3 data timestamp
end