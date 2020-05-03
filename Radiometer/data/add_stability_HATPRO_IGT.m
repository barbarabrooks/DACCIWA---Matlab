%function add_stbility_HATPRO_IGT(dn)
%this only needs to be run if the deployed on a moving platform
%need to DD Lat long, heading
%dn - directory with mat lab files in - same for output
%180204_170000.06.MTi_platform.mat
dn='G:\renfrew\radiometer\matlab';
fsh = 'G:\renfrew\table\matlab\IGT_table.mat';

list=dir(dn);
load(fsh);

for n = 5 : length(list)
    load(fullfile(dn,list(n).name));
    display(['n= ' , num2str(n) , ' ' , fullfile(dn,list(n).name)])
    
    %HKD
    data.HKD.RPY = ones(length(data.HKD.DoY),3).*NaN;
    data.HKD.rate_RPY = ones(length(data.HKD.DoY),3).*NaN;
    for m = 1 : length(data.HKD.DoY)
        ix=find(table.doy<=data.HKD.DoY(m));
        if ~isempty(ix)
            data.HKD.RPY(m,:) = table.EulerAngle(ix(end),:);
            data.HKD.rate_RPY(m,:) = table.RotationRate(ix(end),:); 
        end
    end
    
    %HPC
    data.HPC.RPY = ones(length(data.HPC.DoY),3).*NaN;
    data.HPC.rate_RPY = ones(length(data.HPC.DoY),3).*NaN;
    for m = 1 : length(data.HPC.DoY)
        ix=find(table.doy<=data.HPC.DoY(m));
        if ~isempty(ix)
            data.HPC.RPY(m,:) = table.EulerAngle(ix(end),:);
            data.HPC.rate_RPY(m,:) = table.RotationRate(ix(end),:); 
        end
    end
    
    %IWV
    data.IWV.RPY = ones(length(data.IWV.DoY),3).*NaN;
    data.IWV.rate_RPY = ones(length(data.IWV.DoY),3).*NaN;
    for m = 1 : length(data.IWV.DoY)
        ix=find(table.doy<=data.IWV.DoY(m));
        if ~isempty(ix)
            data.IWV.RPY(m,:) = table.EulerAngle(ix(end),:);
            data.IWV.rate_RPY(m,:) = table.RotationRate(ix(end),:); 
        end
    end
    
    %LWP
    data.LWP.RPY = ones(length(data.LWP.DoY),3).*NaN;
    data.LWP.rate_RPY = ones(length(data.LWP.DoY),3).*NaN;
    for m = 1 : length(data.LWP.DoY)
        ix=find(table.doy<=data.LWP.DoY(m));
        if ~isempty(ix)
            data.LWP.RPY(m,:) = table.EulerAngle(ix(end),:);
            data.LWP.rate_RPY(m,:) = table.RotationRate(ix(end),:); 
        end
    end
    
    %MET
    data.MET.RPY = ones(length(data.MET.DoY),3).*NaN;
    data.MET.rate_RPY = ones(length(data.MET.DoY),3).*NaN;
    for m = 1 : length(data.MET.DoY)
        ix=find(table.doy<=data.MET.DoY(m));
        if ~isempty(ix)
            data.MET.RPY(m,:) = table.EulerAngle(ix(end),:);
            data.MET.rate_RPY(m,:) = table.RotationRate(ix(end),:); 
        end
    end
    
    %STA
    data.STA.RPY = ones(length(data.STA.DoY),3).*NaN;
    data.STA.rate_RPY = ones(length(data.STA.DoY),3).*NaN;
    for m = 1 : length(data.STA.DoY)
        ix=find(table.doy<=data.STA.DoY(m));
        if ~isempty(ix)
            data.STA.RPY(m,:) = table.EulerAngle(ix(end),:);
            data.STA.rate_RPY(m,:) = table.RotationRate(ix(end),:); 
        end
    end
    
    %TPB
    data.TPB.RPY = ones(length(data.TPB.DoY),3).*NaN;
    data.TPB.rate_RPY = ones(length(data.TPB.DoY),3).*NaN;
    for m = 1 : length(data.TPB.DoY)
        ix=find(table.doy<=data.TPB.DoY(m));
        if ~isempty(ix)
            data.TPB.RPY(m,:) = table.EulerAngle(ix(end),:);
            data.TPB.rate_RPY(m,:) = table.RotationRate(ix(end),:); 
        end
    end
    
    %TPC
    data.TPC.RPY = ones(length(data.TPC.DoY),3).*NaN;
    data.TPC.rate_RPY = ones(length(data.TPC.DoY),3).*NaN;
    for m = 1 : length(data.TPC.DoY)
        ix=find(table.doy<=data.TPC.DoY(m));
        if ~isempty(ix)
            data.TPC.RPY(m,:) = table.EulerAngle(ix(end),:);
            data.TPC.rate_RPY(m,:) = table.RotationRate(ix(end),:); 
        end
    end
    
    %BRT
    data.BRT.RPY = ones(length(data.BRT.DoY),3).*NaN;
    data.BRT.rate_RPY = ones(length(data.BRT.DoY),3).*NaN;
    for m = 1 : length(data.BRT.DoY)
        ix=find(table.doy<=data.BRT.DoY(m));
        if ~isempty(ix)
            data.BRT.RPY(m,:) = table.EulerAngle(ix(end),:);
            data.BRT.rate_RPY(m,:) = table.RotationRate(ix(end),:); 
        end
    end
    
    %ATN
    data.ATN.RPY = ones(length(data.ATN.DoY),3).*NaN;
    data.ATN.rate_RPY = ones(length(data.ATN.DoY),3).*NaN;
    for m = 1 : length(data.ATN.DoY)
        ix=find(table.doy<=data.ATN.DoY(m));
        if ~isempty(ix)
            data.ATN.RPY(m,:) = table.EulerAngle(ix(end),:);
            data.ATN.rate_RPY(m,:) = table.RotationRate(ix(end),:); 
        end
    end
    
    %CMP_TPC
    data.CMP_TPC.RPY = ones(length(data.CMP_TPC.DoY),3).*NaN;
    data.CMP_TPC.rate_RPY = ones(length(data.CMP_TPC.DoY),3).*NaN;
    for m = 1 : length(data.CMP_TPC.DoY)
        ix=find(table.doy<=data.CMP_TPC.DoY(m));
        if ~isempty(ix)
            data.CMP_TPC.RPY(m,:) = table.EulerAngle(ix(end),:);
            data.CMP_TPC.rate_RPY(m,:) = table.RotationRate(ix(end),:); 
        end
    end
    
    %BLH
    data.BLH.RPY = ones(length(data.BLH.DoY),3).*NaN;
    data.BLH.rate_RPY = ones(length(data.BLH.DoY),3).*NaN;
    for m = 1 : length(data.BLH.DoY)
        ix=find(table.doy<=data.BLH.DoY(m));
        if ~isempty(ix)
            data.BLH.RPY(m,:) = table.EulerAngle(ix(end),:);
            data.BLH.rate_RPY(m,:) = table.RotationRate(ix(end),:); 
        end
    end
    
    save(fullfile(dn,list(n).name),'data')
    clear data 
end