%function NC_HATPRO_BRT_v4(dn,do,fn_meta, platform, version, offset, flag_moving)

fn_meta='G:\renfrew\radiometer\meta_BRTATT_v1.txt';
do='G:\renfrew\radiometer\NC\BRTATT\v1';
dn='G:\renfrew\radiometer\matlab';
platform ='alliance';
version ='1';
offset = 15;
flag_moving = 1; %0 = stationary, 1 = moving, 2 = trajectory

% Wrapper to create NC files for hatpro
%input
%   dn: directory holding the matlab files
%   do: directory for nc files
%   fn_STAa: full path to project STAa file
%   platform: name of platform (lowercase)
%   version: version of dataset (string)
%   offset: at what height is the instrument above MSL
%   flag_moving: indicateif platofrmis movingor not - %0 = stationary, 1 = moving, 2 = trajectory
%
%file name: <instrument_name>_<platform_name>_<YYYYMMDD>_<data_product>_v<version>.nc

%fields for name
instrument_name = 'ncas-scanning-radiometer-1';
data_product = 'brightness-temperature';

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
    
    data.ATN.flag = data.BRT.flag;
    
    %Make data same length
    l1=length(data.BRT.BRT);l2=length(data.ATN.ATN);
    if l1>=l2
        data1=data.BRT;
        data1.ATN=ones(size(data1.BRT)).*NaN;
        data1.ATN(1:length(data.ATN.ATN),:)=data.ATN.ATN;
    end
    if l2>=l1
        data1=data.ATN;
        data1.BRT=ones(size(data1.ATN)).*NaN;
        data1.BRT(1:length(data.BRT.BRT),:)=data.BRT.BRT;
    end
    clear data
    data=data1; clear data1
    
    % radiation frequencies
    radHz = [22.24 23.04 23.84 25.44 26.24 27.84 31.40 51.26 52.28 53.86 54.94 56.66 57.30 58.00].*1e9;
    
    if ~isempty(data.BRT)
        %create nc file, assumes NC_CLOBBER
        nc_create_empty(fc);
        %global attributes - generic function
        write_NC_header_v1(fc, meta, data.ET, data.lat, data.lon, flag_moving); 
        %Dimensions - General
        write_NC_dimensions_v1(fc, length(data.ET), length(data.lat), length(data.lon),  flag_moving);        
        %Variables - General - Time
        write_NC_time_v1(fc, data.ET, data.DoY, data.DT);
        %Variables - General - Position
        write_NC_position_v1(fc, data.lat, data.lon, flag_moving);
        %only required when instrument on moving platform
        if flag_moving == 1
            %Variables - General - Motion (can be remmed out if not needed
            write_NC_motion_v1(fc, data.course_true, data.orientation, data.speed_wr_water, data.speed_wr_ground,...
                data.RPY, data.rate_RPY, data.flag_angle, data.flag_rate, flag_moving);
        end
        
        write_NC_BRT_header_v4(fc);
        write_NC_BRT_dimensions_v4(length(radHz),fc);
        write_NC_BRT_variables_v4(fc, data.BRT, data.ATN, radHz, offset);
        write_NC_BRT_qc_flags_v4(fc, data.flag);
    end
    %clear fc temp ix f3 data data1
end
