dn = 'G:\renfrew\radiometer\matlab';

list = dir(dn);

for n = 5 : length(list)
    
    load(fullfile(dn,list(n).name));
    display(['n= ' , num2str(n) , ' ' , fullfile(dn,list(n).name)])
    
    %BLH
    if ~isempty(data.BLH)
        [data.BLH.flag_angle, data.BLH.flag_rate] = add_table_flag(data.BLH.lat, data.BLH.RPY, data.BLH.rate_RPY);
    end
    
    %CBH
    if ~isempty(data.CBH)
        [data.CBH.flag_angle, data.CBH.flag_rate] = add_table_flag(data.CBH.lat, data.CBH.RPY, data.CBH.rate_RPY);
    end
    
    %CMP_TPC
    if ~isempty(data.CMP_TPC)
        [data.CMP_TPC.flag_angle, data.CMP_TPC.flag_rate] = add_table_flag(data.CMP_TPC.lat, data.CMP_TPC.RPY, data.CMP_TPC.rate_RPY);
    end    
    
    %HPC
    if ~isempty(data.HPC)
        [data.HPC.flag_angle, data.HPC.flag_rate] = add_table_flag(data.HPC.lat, data.HPC.RPY, data.HPC.rate_RPY);
    end 
    
    %IWV
    if ~isempty(data.IWV)
        [data.IWV.flag_angle, data.IWV.flag_rate] = add_table_flag(data.IWV.lat, data.IWV.RPY, data.IWV.rate_RPY);
    end 
    
    %LPR
    if ~isempty(data.LPR)
        [data.LPR.flag_angle, data.LPR.flag_rate] = add_table_flag(data.LPR.lat, data.LPR.RPY, data.LPR.rate_RPY);
    end 
    
    %LWP
    if ~isempty(data.LWP)
        [data.LWP.flag_angle, data.LWP.flag_rate] = add_table_flag(data.LWP.lat, data.LWP.RPY, data.LWP.rate_RPY);
    end 
    
    %MET
    if ~isempty(data.MET)
        [data.MET.flag_angle, data.MET.flag_rate] = add_table_flag(data.MET.lat, data.MET.RPY, data.MET.rate_RPY);
    end 
    
    %STA
    if ~isempty(data.STA)
        [data.STA.flag_angle, data.STA.flag_rate] = add_table_flag(data.STA.lat, data.STA.RPY, data.STA.rate_RPY);
    end 
    
    %TPB
    if ~isempty(data.TPB)
        [data.TPB.flag_angle, data.TPB.flag_rate] = add_table_flag(data.TPB.lat, data.TPB.RPY, data.TPB.rate_RPY);
    end 
    
    %TPC
    if ~isempty(data.TPC)
        [data.TPC.flag_angle, data.TPC.flag_rate] = add_table_flag(data.TPC.lat, data.TPC.RPY, data.TPC.rate_RPY);
    end 
    
    %BRT
    if ~isempty(data.BRT)
        [data.BRT.flag_angle, data.BRT.flag_rate] = add_table_flag(data.BRT.lat, data.BRT.RPY, data.BRT.rate_RPY);
    end 
    
    %ATN
    if ~isempty(data.ATN)
        [data.ATN.flag_angle, data.ATN.flag_rate] = add_table_flag(data.ATN.lat, data.ATN.RPY, data.ATN.rate_RPY);
    end 
    
    %IWP
    data.IWP = [];
    %if ~isempty(data.IWP)
    %    [data.IWP.flag_angle, data.IWP.flag_rate] = add_table_flag(data.IWP.lat, data.IWP.RPY, data.IWP.rate_RPY);
    %end 
    
    save(fullfile(dn,list(n).name),'data')
    clear data 
end