function Wrapper_EB1_v1(dn,do)

%dn='E:\raw\fluxtower1a\sorted';
%do='E:\WORKING\EB1\matlab';
HK=[];RD=[];SHF=[];SM=[];ST=[];
% parse the data    
[HK] =get_EB1_HouseKeeping_v1(fullfile(dn,'CR5000_Housekeeping.dat'));
[RD] =get_EB1_Radiation_v1(fullfile(dn,'CR5000_Radiation.dat'));
[SHF]=get_EB1_SoilHeatFlux_v1(fullfile(dn,'CR5000_SoilHeatFlux.dat'));
[SM] =get_EB1_SoilMoisture_v1(fullfile(dn,'CR5000_SoilMoisture.dat'));
[ST] =get_EB1_SoilTemperature_v1(fullfile(dn,'CR5000_SoilTemperature.dat'));

[HK] =QC_HK_v1(HK);
[RD] =QC_RD_v1(RD);
[SHF]=QC_SHF_v1(SHF);
[SM] =QC_SM_v1(SM);
[ST] =QC_ST_v1(ST);

%split into daily files and save
for n=1:12
    for m=1:31
        data.HK=[];data.RD=[];data.SHF=[];data.SM=[];data.ST=[];
        
        if ~isempty(HK)
            ix_HK=find((HK.DT(:,2)==n)&(HK.DT(:,3)==m));
            if ~isempty(ix_HK)
                data.HK.DT=HK.DT(ix_HK,:);
                data.HK.DoY=HK.DoY(ix_HK);
                data.HK.ST=HK.ST(ix_HK);
                data.HK.ET=HK.ET(ix_HK);
                data.HK.record=HK.record(ix_HK);
                data.HK.loggerT=HK.loggerT(ix_HK);
                data.HK.loggerSupplyVolts=HK.loggerSupplyVolts(ix_HK);
                data.HK.flag=HK.flag(ix_HK);
            end
        end
        
        if ~isempty(RD)
            ix_RD=find((RD.DT(:,2)==n)&(RD.DT(:,3)==m));
            if ~isempty(ix_RD);
                data.RD.DT=RD.DT(ix_RD,:);
                data.RD.DoY=RD.DoY(ix_RD);
                data.RD.ST=RD.ST(ix_RD);
                data.RD.ET=RD.ET(ix_RD);
                data.RD.record=RD.record(ix_RD);
                data.RD.SWUP=RD.SWUP(ix_RD);
                data.RD.SWDN=RD.SWDN(ix_RD);
                data.RD.IRUP=RD.IRUP(ix_RD);
                data.RD.IRDN=RD.IRDN(ix_RD);
                data.RD.BodyT=RD.BodyT(ix_RD);
                data.RD.IRUPCOR=RD.IRUPCOR(ix_RD);
                data.RD.IRDNCOR=RD.IRDNCOR(ix_RD);
                data.RD.flag.SWUP=RD.flag.SWUP(ix_RD);
                data.RD.flag.SWDN=RD.flag.SWDN(ix_RD);
                data.RD.flag.IRUP=RD.flag.IRUP(ix_RD);
                data.RD.flag.IRDN=RD.flag.IRDN(ix_RD);
                data.RD.flag.IRUPCOR=RD.flag.IRUPCOR(ix_RD);
                data.RD.flag.IRDNCOR=RD.flag.IRDNCOR(ix_RD);
                data.RD.flag.BodyT=RD.flag.BodyT(ix_RD);
                data.RD.flag.Cleaning=RD.flag.Cleaning(ix_RD);
            end
        end
        
        if ~isempty(SHF)
            ix_SHF=find((SHF.DT(:,2)==n)&(SHF.DT(:,3)==m));
            if ~isempty(ix_SHF);
                data.SHF.DT=SHF.DT(ix_SHF,:);
                data.SHF.DoY=SHF.DoY(ix_SHF);
                data.SHF.ST=SHF.ST(ix_SHF);
                data.SHF.ET=SHF.ET(ix_SHF);
                data.SHF.record=SHF.record(ix_SHF);
                data.SHF.SHF1=SHF.SHF1(ix_SHF);
                data.SHF.SHF2=SHF.SHF2(ix_SHF);
                data.SHF.SHF3=SHF.SHF3(ix_SHF);
                data.SHF.SHF_CAL1=SHF.SHF_CAL1(ix_SHF);
                data.SHF.SHF_CAL2=SHF.SHF_CAL2(ix_SHF);
                data.SHF.SHF_CAL3=SHF.SHF_CAL3(ix_SHF);
                data.SHF.flag.SHF1=SHF.flag.SHF1(ix_SHF);
                data.SHF.flag.SHF2=SHF.flag.SHF2(ix_SHF);
                data.SHF.flag.SHF3=SHF.flag.SHF3(ix_SHF);
            end
        end
        
        if ~isempty(SM)
            ix_SM=find((SM.DT(:,2)==n)&(SM.DT(:,3)==m));
            if ~isempty(ix_SM);
                data.SM.DT=SM.DT(ix_SM,:);
                data.SM.DoY=SM.DoY(ix_SM);
                data.SM.ST=SM.ST(ix_SM);
                data.SM.ET=SM.ET(ix_SM);
                data.SM.record=SM.record(ix_SM);
                data.SM.SM_kOH1=SM.SM_kOH1(ix_SM);
                data.SM.SM_kOH2=SM.SM_kOH2(ix_SM);
                data.SM.SM_kOH3=SM.SM_kOH3(ix_SM);
                data.SM.SM_kPA1=SM.SM_kPA1(ix_SM);
                data.SM.SM_kPA2=SM.SM_kPA2(ix_SM);
                data.SM.SM_kPA3=SM.SM_kPA3(ix_SM);
                data.SM.flag.SM1=SM.flag.SM1(ix_SM);
                data.SM.flag.SM2=SM.flag.SM2(ix_SM);
                data.SM.flag.SM3=SM.flag.SM3(ix_SM);
            end
        end
        
        if ~isempty(ST)
            ix_ST=find((ST.DT(:,2)==n)&(ST.DT(:,3)==m));
            if ~isempty(ix_ST);
                data.ST.DT=ST.DT(ix_ST,:);
                data.ST.DoY=ST.DoY(ix_ST);
                data.ST.ST=ST.ST(ix_ST);
                data.ST.ET=ST.ET(ix_ST);
                data.ST.record=ST.record(ix_ST);
                data.ST.T1=ST.T1(ix_ST);
                data.ST.T2=ST.T2(ix_ST);
                data.ST.T3=ST.T3(ix_ST);
                data.ST.flag.ST1=ST.flag.ST1(ix_ST);
                data.ST.flag.ST2=ST.flag.ST2(ix_ST);
                data.ST.flag.ST3=ST.flag.ST3(ix_ST);
            end
        end
        
        if ~isempty(data.HK)
            fn=datestr(data.HK.ST(1),'YYYYmmDD');
            %save
            save(fullfile(do,[fn,'.mat']),'data','-v7.3');
        end
    end
end