%function NC_HATPRO_BLH_v1(dn,do,fn_meta, platform, version, offset, flag_moving)

fn_meta='G:\renfrew\radiometer\meta_BLH_v0.txt';
do='G:\renfrew\radiometer\NC\BLH\v0'
dn='G:\renfrew\radiometer\matlab'
platform ='alliance';
version ='0';
offset = 15;
flag_moving = 1; %0 = stationary, 1 = moving, 2 = trajectory

% Wrapper to create NC files for hatpro
%input
%   dn: directory holding the matlab files
%   do: directory for nc files
%   fn_meta: full path to project meta file
%   platform: name of platform (lowercase)
%   version: version of dataset (string)
%   offset: at what height is the instrument above MSL
%   flag_moving: indicateif platofrmis movingor not - %0 = stationary, 1 = moving, 2 = trajectory
%
%file name: <instrument_name>_<platform_name>_<YYYYMMDD>_<data_product>_v<version>.nc

%fields for name
instrument_name = 'ncas-scanning-radiometer-1';
data_product = 'boundary-layer-height';

%get meat data
meta = get_meta_tsv_v1(fn_meta);

%get list of what is to be converted
list=dir(dn);

% run through list ad create nc files
for n=5:length(list)
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
    
    %fudge 
    data.BLH.flag = data.TPB.flag;
    
    if ~isempty(data.BLH)
        %create nc file, assumes NC_CLOBBER
        nc_create_empty(fc);
        %global attributes - generic function
        write_NC_header_v1(fc, meta, data.BLH.ET, data.BLH.lat, data.BLH.lon, flag_moving); 
        %Dimensions - General
        write_NC_dimensions_v1(fc, length(data.BLH.ET), length(data.BLH.lat), length(data.BLH.lon),  flag_moving);        
        %Variables - General - Time
        write_NC_time_v1(fc, data.BLH.ET, data.BLH.DoY, data.BLH.DT);
        %Variables - General - Position
        write_NC_position_v1(fc, data.BLH.lat, data.BLH.lon, flag_moving);
        %only required when instrument on moving platform
        if flag_moving == 1
            %Variables - General - Motion (can be remmed out if not needed
            write_NC_motion_v1(fc, data.BLH.course_true, data.BLH.orientation, data.BLH.speed_wr_water, data.BLH.speed_wr_ground,...
                data.BLH.RPY, data.BLH.rate_RPY, data.BLH.flag_angle, data.BLH.flag_rate, flag_moving);
        end
        
        write_NC_BLH_header_v1(fc);
        write_NC_BLH_dimensions_v1(fc);
        write_NC_BLH_variables_v1(fc, data.BLH.BLH, offset);
        write_NC_BLH_qc_flags_v1(fc, data.BLH.flag);
    end
    %clear fc temp ix f3 data data1
end
