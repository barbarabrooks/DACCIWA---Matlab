function [data_out, fo]=parse_HATPRO_v1(di)
%input path to day file 
%di='D:\temp\RADIOMETER\2016\06\D25';

ext(1,:)= '.BLH.ASC    ';data_out.BLH=[];
ext(2,:)= '.CBH.ASC    ';data_out.CBH=[];
ext(3,:)= '.CMP.TPC.ASC';data_out.CMP_TPC=[];
ext(4,:)= '.HKD.ASC    ';data_out.HKD=[];
ext(5,:)= '.HPC.ASC    ';data_out.HPC=[];
ext(6,:)= '.IWV.ASC    ';data_out.IWV=[];
ext(7,:)= '.LPR.ASC    ';data_out.LPR=[];
ext(8,:)= '.LWP.ASC    ';data_out.LWP=[];
ext(9,:)= '.MET.ASC    ';data_out.MET=[];
ext(10,:)='.STA.ASC    ';data_out.STA=[];
ext(11,:)='.TPB.ASC    ';data_out.TPB=[];
ext(12,:)='.TPC.ASC    ';data_out.TPC=[];
ext(13,:)='.BRT.ASC    ';data_out.BRT=[];
ext(14,:)='.ATN.ASC    ';data_out.ATN=[];

list=dir(di);%no files

for n= 3:length(list)
    fn=list(n).name;

    %only want to load either daily or hourly files
    %check for both
    %if daily present then first filename will be YYmmDD.xxx
    %if hourly present then first filename will be YYmmDDHH.xxx 
    %how long is the file name
    ix=find(fn=='.');
    %set the inital length of the file
    if n == 3
        init_length = length(fn(1:ix(1)-1));
    end
    %check the length of the file. 
    if (length(fn(1:ix(1)-1)) ~= init_length)
        break
    end
    
    f=fullfile(di,fn);
    temp=fn(ix(1):length(fn));
    
    if strcmp(ext(1,1:8),temp) %BLH
        [data]=get_BLH(f);
        if isempty(data_out.BLH)
            data_out.BLH.DT=data.DT;
            data_out.BLH.flag=data.flag;
            data_out.BLH.BLH=data.BLH;
        else
            data_out.BLH.DT=[data_out.BLH.DT;data.DT];
            data_out.BLH.flag=[data_out.BLH.flag;data.flag];
            data_out.BLH.BLH=[data_out.BLH.BLH;data.BLH];
        end
        clear data
    end  
            
    if strcmp(ext(2,1:8),temp) %CBH
        [data]=get_CBH(f);
         if isempty(data_out.CBH)
            data_out.CBH.DT=data.DT;
            data_out.CBH.flag=data.flag;
            data_out.CBH.CBH=data.CBH;
         else
            data_out.CBH.DT=[data_out.CBH.DT;data.DT];
            data_out.CBH.flag=[data_out.CBH.flag;data.flag];
            data_out.CBH.CBH=[data_out.CBH.CBH;data.CBH];
         end
         clear data
    end
            
    if strcmp(ext(3,:),temp) %CMP.TPC
        [data]=get_TPC(f);
        if isempty(data_out.CMP_TPC)
            data_out.CMP_TPC.Z=data.z;
            data_out.CMP_TPC.DT=data.DT;
            data_out.CMP_TPC.T=data.T;
            data_out.CMP_TPC.flag=data.flag;
        else
            data_out.CMP_TPC.DT=[data_out.CMP_TPC.DT;data.DT];
            data_out.CMP_TPC.T=[data_out.CMP_TPC.T;data.T];
            data_out.CMP_TPC.flag=[data_out.CMP_TPC.flag;data.flag];
        end
        clear data
    end 
            
    if strcmp(ext(4,1:8),temp) %HKD
        [data]=get_HKD(f);
        if isempty(data_out.HKD)
            data_out.HKD.DT=data.DT;
            data_out.HKD.TAmb1=data.Tamb1;
            data_out.HKD.TAmb2=data.Tamb2;
            data_out.HKD.TRec1=data.TRec1;
            data_out.HKD.TRec2=data.TRec2;
            data_out.HKD.SRec1=data.SRec1;
            data_out.HKD.SRec2=data.SRec2;
            data_out.HKD.bin_str=data.bin_str;
        else
            data_out.HKD.DT=[data_out.HKD.DT;data.DT];
            data_out.HKD.TAmb1=[data_out.HKD.TAmb1;data.Tamb1];
            data_out.HKD.TAmb2=[data_out.HKD.TAmb2;data.Tamb2];
            data_out.HKD.TRec1=[data_out.HKD.TRec1;data.TRec1];
            data_out.HKD.TRec2=[data_out.HKD.TRec2;data.TRec2];
            data_out.HKD.SRec1=[data_out.HKD.SRec1;data.SRec1];
            data_out.HKD.SRec2=[data_out.HKD.SRec2;data.SRec2];
            data_out.HKD.bin_str=[data_out.HKD.bin_str;data.bin_str];
       end
       clear data
    end
            
    if strcmp(ext(5,1:8),temp) %HPC
        [data]=get_HPC(f);
        if isempty(data_out.HPC)
            data_out.HPC.Z=data.z;
            data_out.HPC.DT=data.DT;
            data_out.HPC.flag=data.flag;
            data_out.HPC.abh=data.abh;
            data_out.HPC.rh=data.rh;
        else
            data_out.HPC.DT=[data_out.HPC.DT;data.DT];
            data_out.HPC.flag=[data_out.HPC.flag;data.flag];
            data_out.HPC.abh=[data_out.HPC.abh;data.abh];
            data_out.HPC.rh=[data_out.HPC.rh;data.rh];
        end
        clear data
    end
            
    if strcmp(ext(6,1:8),temp) %IWV
        [data]=get_IWV(f);
        if isempty(data_out.IWV)
            data_out.IWV.DT=data.DT;
            data_out.IWV.flag=data.flag;
            data_out.IWV.IWV=data.IWV;
            data_out.IWV.AZ=data.AZI;
            data_out.IWV.EL=data.ELV;
        else
            data_out.IWV.DT=[data_out.IWV.DT;data.DT];
            data_out.IWV.flag=[data_out.IWV.flag;data.flag];
            data_out.IWV.IWV=[data_out.IWV.IWV;data.IWV];
            data_out.IWV.AZ=[data_out.IWV.AZ;data.AZI];
            data_out.IWV.EL=[data_out.IWV.EL;data.ELV];
        end
        clear data
    end
            
    if strcmp(ext(7,1:8),temp) %LPR
        [data]=get_LPR(f);
        if isempty(data_out.LPR)
            data_out.LPR.Z=data.z;
            data_out.LPR.DT=data.DT;
            data_out.LPR.flag=data.flag;
            data_out.LPR.LPR=data.LPR;
        else
            data_out.LPR.DT=[data_out.LPR.DT;data.DT];
            data_out.LPR.flag=[data_out.LPR.flag;data.flag];
            data_out.LPR.LPR=[data_out.LPR.LPR;data.LPR];
        end
        clear data
     end
            
     if strcmp(ext(8,1:8),temp)%LWP
        [data]=get_LWP(f);
        if isempty(data_out.LWP)
            data_out.LWP.DT=data.DT;
            data_out.LWP.flag=data.flag;
            data_out.LWP.LWP=data.LWP;
            data_out.LWP.AZ=data.AZI;
            data_out.LWP.EL=data.ELV;
        else
            data_out.LWP.DT=[data_out.LWP.DT;data.DT];
            data_out.LWP.flag=[data_out.LWP.flag;data.flag];
            data_out.LWP.LWP=[data_out.LWP.LWP;data.LWP];
            data_out.LWP.AZ=[data_out.LWP.AZ;data.AZI];
            data_out.LWP.EL=[data_out.LWP.EL;data.ELV];
        end
        clear data
     end
     
     if strcmp(ext(9,1:8),temp) %MET
        [data]=get_MET(f);
        if isempty(data_out.MET)
            data_out.MET.DT=data.DT;
            data_out.MET.flag=data.flag;
            data_out.MET.PP=data.PP;%mbar
            data_out.MET.T=data.T;%K
            data_out.MET.RH=data.RH;%RH
        else
            data_out.MET.DT=[data_out.MET.DT;data.DT];
            data_out.MET.flag=[data_out.MET.flag;data.flag];
            data_out.MET.PP=[data_out.MET.PP;data.PP];%mbar
            data_out.MET.T=[data_out.MET.T;data.T];%K
            data_out.MET.RH=[data_out.MET.RH;data.RH];%RH
        end
        clear data
     end
            
     if strcmp(ext(10,1:8),temp) %STA
        [data]=get_STA(f);
        if isempty(data_out.STA)
            data_out.STA.DT=data.DT;
            data_out.STA.LI=data.LI;%K
            data_out.STA.KOI=data.KOI;%K
            data_out.STA.TTI=data.TTI;%K
            data_out.STA.KI=data.KI;%K
            data_out.STA.SI=data.SI;%K
            data_out.STA.CAPE=data.CAPE;%J/Kg
            data_out.STA.flag=data.flag;
        else
            data_out.STA.DT=[data_out.STA.DT;data.DT];
            data_out.STA.LI=[data_out.STA.LI;data.LI];%K
            data_out.STA.KOI=[data_out.STA.KOI;data.KOI];%K
            data_out.STA.TTI=[data_out.STA.TTI;data.TTI];%K
            data_out.STA.KI=[data_out.STA.KI;data.KI];%K
            data_out.STA.SI=[data_out.STA.SI;data.SI];%K
            data_out.STA.CAPE=[data_out.STA.CAPE;data.CAPE];%J/Kg
            data_out.STA.flag=[data_out.STA.flag;data.flag];
        end
        clear data
     end
            
     if strcmp(ext(11,1:8),temp) %TPB
        [data]=get_TPB(f);
        if isempty(data_out.TPB)
            data_out.TPB.Z=data.z;
            data_out.TPB.DT=data.DT;
            data_out.TPB.T=data.T;
            data_out.TPB.flag=data.flag;
        else
            data_out.TPB.DT=[data_out.TPB.DT;data.DT];
            data_out.TPB.T=[data_out.TPB.T;data.T];
            data_out.TPB.flag=[data_out.TPB.flag;data.flag];
        end
            clear data
     end
            
     if strcmp(ext(12,1:8),temp) %TPC
        [data]=get_TPC(f);
        if isempty(data_out.TPC)
            data_out.TPC.Z=data.z;
            data_out.TPC.DT=data.DT;
            data_out.TPC.T=data.T;
            data_out.TPC.flag=data.flag;
        else
            data_out.TPC.DT=[data_out.TPC.DT;data.DT];
            data_out.TPC.T=[data_out.TPC.T;data.T];
            data_out.TPC.flag=[data_out.TPC.flag;data.flag];
        end
        clear data
     end
            
     if strcmp(ext(13,1:8),temp) %BRT
        [data]=get_BRT(f);
        if isempty(data_out.BRT)
            data_out.BRT.DT=data.DT;
            data_out.BRT.flag=data.flag;
            data_out.BRT.BRT=data.BRT;
            data_out.BRT.AZ=data.AZI;
            data_out.BRT.EL=data.ELV;
        else
            data_out.BRT.DT=[data_out.BRT.DT;data.DT];
            data_out.BRT.flag=[data_out.BRT.flag;data.flag];
            data_out.BRT.BRT=[data_out.BRT.BRT;data.BRT];
            data_out.BRT.AZ=[data_out.BRT.AZ;data.AZI];
            data_out.BRT.EL=[data_out.BRT.EL;data.ELV];
        end
        clear data
     end
            
     if strcmp(ext(14,1:8),temp) %ATN
        [data]=get_ATN(f);
        if isempty(data_out.ATN)
            data_out.ATN.DT=data.DT;
            data_out.ATN.flag=data.flag;
            data_out.ATN.ATN=data.ATN;
            data_out.ATN.AZ=data.AZI;
            data_out.ATN.EL=data.ELV;
        else
            data_out.ATN.DT=[data_out.ATN.DT;data.DT];
            data_out.ATN.flag=[data_out.ATN.flag;data.flag];
            data_out.ATN.ATN=[data_out.ATN.ATN;data.ATN];
            data_out.ATN.AZ=[data_out.ATN.AZ;data.AZI];
            data_out.ATN.EL=[data_out.ATN.EL;data.ELV];
        end
        clear data
    end       
end
 
if ~isempty(data_out.BLH)
    [DoY,~,ET]=file_times(data_out.BLH.DT');
    data_out.BLH.DoY=DoY';data_out.BLH.ET=ET';clear DoY ET
end

if ~isempty(data_out.CBH)
    [DoY,~,ET]=file_times(data_out.CBH.DT');
    data_out.CBH.DoY=DoY';data_out.CBH.ET=ET';clear DoY ET
end

if ~isempty(data_out.CMP_TPC)
    [DoY,~,ET]=file_times(data_out.CMP_TPC.DT');
    data_out.CMP_TPC.DoY=DoY';data_out.CMP_TPC.ET=ET';clear DoY ET
end
    
if ~isempty(data_out.HKD)
    [DoY,~,ET]=file_times(data_out.HKD.DT');
    data_out.HKD.DoY=DoY';data_out.HKD.ET=ET';clear DoY ET
end

if ~isempty(data_out.HPC)
    [DoY,~,ET]=file_times(data_out.HPC.DT');
    data_out.HPC.DoY=DoY';data_out.HPC.ET=ET';clear DoY ET
end

if ~isempty(data_out.IWV)
    [DoY,~,ET]=file_times(data_out.IWV.DT');
    data_out.IWV.DoY=DoY';data_out.IWV.ET=ET';clear DoY ET
end

if ~isempty(data_out.LPR)
    [DoY,~,ET]=file_times(data_out.LPR.DT');
    data_out.LPR.DoY=DoY';data_out.LPR.ET=ET';clear DoY ET
end

if ~isempty(data_out.LWP)
    [DoY,~,ET]=file_times(data_out.LWP.DT');
    data_out.LWP.DoY=DoY';data_out.LWP.ET=ET';clear DoY ET
end

if ~isempty(data_out.MET)
    [DoY,~,ET]=file_times(data_out.MET.DT');
    data_out.MET.DoY=DoY';data_out.MET.ET=ET';clear DoY ET
end

if ~isempty(data_out.STA)
    [DoY,~,ET]=file_times(data_out.STA.DT');
    data_out.STA.DoY=DoY';data_out.STA.ET=ET';clear DoY ET
end

if ~isempty(data_out.TPB)
    [DoY,~,ET]=file_times(data_out.TPB.DT');
    data_out.TPB.DoY=DoY';data_out.TPB.ET=ET';clear DoY ET
end

if ~isempty(data_out.TPC)
    [DoY,~,ET]=file_times(data_out.TPC.DT');
    data_out.TPC.DoY=DoY';data_out.TPC.ET=ET';clear DoY ET
end

if ~isempty(data_out.BRT)
    [DoY,~,ET]=file_times(data_out.BRT.DT');
    data_out.BRT.DoY=DoY';data_out.BRT.ET=ET';clear DoY ET
end

if ~isempty(data_out.ATN)
    [DoY,~,ET]=file_times(data_out.ATN.DT');
    data_out.ATN.DoY=DoY';data_out.ATN.ET=ET';clear DoY ET
end

temp=list(3).name;
fo=(['20',temp(1:6),'.mat']);

