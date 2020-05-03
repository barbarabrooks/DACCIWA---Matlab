function [d1]=QC_HATPRO_v1(d1)

if ~isempty(d1.MET)
    %temperature
    ix.ix_temperature=find((d1.MET.T>(273.15+45))|(d1.MET.T<(273.15-40)));
    %pressure
    ix.ix_pressure=find((d1.MET.PP>1100)|(d1.MET.PP<500));
    %rh
    ix.ix_rh=find((d1.MET.RH>95)|(d1.MET.RH<5));
end

if ~isempty(d1.HKD)
    %rain flag
    ix.ix_rain=find(d1.HKD.bin_str(:,end-16)=='1');%rain bit 17 "0 no rain 1 rain"

    %receiver stabilty 5 - 10mK 2
    ix.ix21=find((d1.HKD.SRec1<=0.01)&(d1.HKD.SRec1>0.005));%h
    ix.ix22=find((d1.HKD.SRec2<=0.01)&(d1.HKD.SRec2>0.005));%t

    %receiver stabilty 10 - 50mK 3 
    ix.ix31=find((d1.HKD.SRec1<=0.05)&(d1.HKD.SRec1>0.01));%h
    ix.ix32=find((d1.HKD.SRec2<=0.05)&(d1.HKD.SRec2>0.01));%t

    %receiver stabilty 50 - 100mK 4
    ix.ix41=find((d1.HKD.SRec1<=0.1)&(d1.HKD.SRec1>0.05));%h
    ix.ix42=find((d1.HKD.SRec2<=0.1)&(d1.HKD.SRec2>0.05));%t

    %receiver stabilty 100 - 500mK 5 
    ix.ix51=find((d1.HKD.SRec1<=0.5)&(d1.HKD.SRec1>0.1));%h
    ix.ix52=find((d1.HKD.SRec2<=0.5)&(d1.HKD.SRec2>0.1));%t

    %receiver stabilty >500mK 6
    ix.ix61=find(d1.HKD.SRec1>0.5);%h
    ix.ix62=find(d1.HKD.SRec2>0.5);%t

    %channel failures 1= ok 0 failed
    ix.ix_ch1=find(d1.HKD.bin_str(:,end)=='0');%h bit 1
    ix.ix_ch2=find(d1.HKD.bin_str(:,end-1)=='0');%h bit 2
    ix.ix_ch3=find(d1.HKD.bin_str(:,end-2)=='0');%h bit 3
    ix.ix_ch4=find(d1.HKD.bin_str(:,end-3)=='0');%h bit 4
    ix.ix_ch5=find(d1.HKD.bin_str(:,end-4)=='0');%h bit 5
    ix.ix_ch6=find(d1.HKD.bin_str(:,end-5)=='0');%h bit 6
    ix.ix_ch7=find(d1.HKD.bin_str(:,end-6)=='0');%h bit 7
    ix.ix_ch8=find(d1.HKD.bin_str(:,end-8)=='0');%t bit 9
    ix.ix_ch9=find(d1.HKD.bin_str(:,end-9)=='0');%t bit 10
    ix.ix_ch10=find(d1.HKD.bin_str(:,end-10)=='0');%t bit 11
    ix.ix_ch11=find(d1.HKD.bin_str(:,end-11)=='0');%t bit 12
    ix.ix_ch12=find(d1.HKD.bin_str(:,end-12)=='0');%t bit 13
    ix.ix_ch13=find(d1.HKD.bin_str(:,end-13)=='0');%t bit 14
    ix.ix_ch14=find(d1.HKD.bin_str(:,end-14)=='0');%t bit 15
end
%BLH.ASC
%[d1.BLH.flag]=QC_DDD_v1(d1.BLH,d1.HKD,d1.MET,ix);
%CBH.ASC   time stamp problem 
%CMP.TPC.ASC'
%[d1.CMP_TPC.flag]=QC_DDD_v1(d1.CMP_TPC,d1.HKD,d1.MET,ix);  

%HPC.ASC
if (~isempty(d1.HPC)&~isempty(d1.HKD)&~isempty(d1.MET))
    [d1.HPC.flag]=QC_DDD_v1(d1.HPC,d1.HKD,d1.MET,ix);
end

%IWV.ASC 
if (~isempty(d1.IWV)&~isempty(d1.HKD)&~isempty(d1.MET)) 
    [d1.IWV.flag]=QC_DDD_v1(d1.IWV,d1.HKD,d1.MET,ix);
end

%LPR.ASC   time stamp problem
%LWP.ASC 
if (~isempty(d1.LWP)&~isempty(d1.HKD)&~isempty(d1.MET))  
    [d1.LWP.flag]=QC_DDD_v1(d1.LWP,d1.HKD,d1.MET,ix);
end

%MET.ASC 
if ~isempty(d1.MET)
    [d1.MET.flag]=QC_DDD_MET_v1(d1.MET,ix);
end

%STA.ASC   
if (~isempty(d1.STA)&~isempty(d1.HKD)&~isempty(d1.MET)) 
    [d1.STA.flag]=QC_DDD_v1(d1.STA,d1.HKD,d1.MET,ix);
end

%TPB.ASC    
if (~isempty(d1.TPB)&~isempty(d1.HKD)&~isempty(d1.MET)) 
    [d1.TPB.flag]=QC_DDD_v1(d1.TPB,d1.HKD,d1.MET,ix);
end

%TPC.ASC 
if (~isempty(d1.TPC)&~isempty(d1.HKD)&~isempty(d1.MET)) 
    [d1.TPC.flag]=QC_DDD_v1(d1.TPC,d1.HKD,d1.MET,ix);
end

%BRT.ASC    
if (~isempty(d1.BRT)&~isempty(d1.HKD)&~isempty(d1.MET)) 
    [d1.BRT.flag]=QC_DDD_v1(d1.BRT,d1.HKD,d1.MET,ix);
end
%ATN.ASC   
%[d1.ATN.flag]=QC_DDD_v1(d1.ATN,d1.HKD,d1.MET,ix);