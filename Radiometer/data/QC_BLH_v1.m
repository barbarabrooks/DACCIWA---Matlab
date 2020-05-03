function [flag]=QC_BLH_v1(BLH,HKD,MET,ix)

clear d1.BLH.flag
%1=good data
flag.T=ones(size(BLH.DoY));     flag.PP=ones(size(BLH.DoY));  flag.RH=ones(size(BLH.DoY));  flag.RAIN=ones(size(BLH.DoY));
flag.CH1=ones(size(BLH.DoY));   flag.CH2=ones(size(BLH.DoY)); flag.CH3=ones(size(BLH.DoY)); flag.CH4=ones(size(BLH.DoY));
flag.CH5=ones(size(BLH.DoY));   flag.CH6=ones(size(BLH.DoY)); flag.CH7=ones(size(BLH.DoY)); flag.CH8=ones(size(BLH.DoY));
flag.CH9=ones(size(BLH.DoY));   flag.CH10=ones(size(BLH.DoY));flag.CH11=ones(size(BLH.DoY));flag.CH12=ones(size(BLH.DoY));
flag.CH13=ones(size(BLH.DoY));  flag.CH14=ones(size(BLH.DoY));
flag.T_stab=ones(size(BLH.DoY));flag.RH_stab=ones(size(BLH.DoY));

if ~isempty(ix.ix_temperature)
    for n=1:length(ix.ix_temperature)
        xx=find((BLH.DT(:,4)==MET.DT(ix.ix_temperature(n),4)) & (BLH.DT(:,5)==MET.DT(ix.ix_temperature(n),5)) );
        if ~isempty(xx);
            flag.T(xx)=2;
            clear xx
        end
    end
end
if ~isempty(ix.ix_pressure)
    for n=1:length(ix.pressure)
        xx=find((BLH.DT(:,4)==MET.DT(ix.ix_pressure(n),4)) & (BLH.DT(:,5)==MET.DT(ix.ix_pressure(n),5)) );
        if ~isempty(xx);
            flag.PP(xx)=2;
            clear xx
        end
    end
end
if ~isempty(ix.ix_rh)
    for n=1:length(ix.rh)
        xx=find((BLH.DT(:,4)==MET.DT(ix.ix_rh(n),4)) & (BLH.DT(:,5)==MET.DT(ix.ix_rh(n),5)) );
        if ~isempty(xx);
            flag.RH(xx)=2;
            clear xx
        end
    end
end
if ~isempty(ix.ix_rain)
    for n=1:length(ix.ix_rain)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix_rain(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix_rain(n),5)) );
        if ~isempty(xx);
            flag.RAIN(xx)=2;
            clear xx
        end
    end
end

if ~isempty(ix.ix_ch1)
    for n=1:length(ix.ix_ch1)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix_ch1(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix_ch1(n),5)) );
        if ~isempty(xx);
            flag.CH1(xx)=2;
            clear xx
        end
    end
end
if ~isempty(ix.ix_ch2)
    for n=1:length(ix.ix_ch2)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix_ch2(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix_ch2(n),5)) );
        if ~isempty(xx);
            flag.CH2(xx)=2;
            clear xx
        end
    end
end
if ~isempty(ix.ix_ch3)
    for n=1:length(ix.ix_ch3)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix_ch3(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix_ch3(n),5)) );
        if ~isempty(xx);
            flag.CH3(xx)=2;
            clear xx
        end
    end
end
if ~isempty(ix.ix_ch4)
    for n=1:length(ix.ix_ch4)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix_ch4(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix_ch4(n),5)) );
        if ~isempty(xx);
            flag.CH4(xx)=2;
            clear xx
        end
    end
end
if ~isempty(ix.ix_ch5)
    for n=1:length(ix.ix_ch5)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix_ch5(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix_ch5(n),5)) );
        if ~isempty(xx);
            flag.CH5(xx)=2;
            clear xx
        end
    end
end
if ~isempty(ix.ix_ch6)
    for n=1:length(ix.ix_ch6)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix_ch6(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix_ch6(n),5)) );
        if ~isempty(xx);
            flag.CH6(xx)=2;
            clear xx
        end
    end
end
if ~isempty(ix.ix_ch7)
    for n=1:length(ix.ix_ch7)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix_ch7(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix_ch7(n),5)) );
        if ~isempty(xx);
            flag.CH7(xx)=2;
            clear xx
        end
    end
end

if ~isempty(ix.ix_ch8)
    for n=1:length(ix.ix_ch8)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix_ch8(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix_ch8(n),5)) );
        if ~isempty(xx);
            flag.CH8(xx)=2;
            clear xx
        end
    end
end
if ~isempty(ix.ix_ch9)
    for n=1:length(ix.ix_ch9)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix_ch9(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix_ch9(n),5)) );
        if ~isempty(xx);
            flag.CH9(xx)=2;
            clear xx
        end
    end
end
if ~isempty(ix.ix_ch10)
    for n=1:length(ix.ix_ch10)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix_ch10(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix_ch10(n),5)) );
        if ~isempty(xx);
            flag.CH10(xx)=2;
            clear xx
        end
    end
end
if ~isempty(ix.ix_ch11)
    for n=1:length(ix.ix_ch11)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix_ch11(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix_ch11(n),5)) );
        if ~isempty(xx);
            flag.CH11(xx)=2;
            clear xx
        end
    end
end
if ~isempty(ix.ix_ch12)
    for n=1:length(ix.ix_ch12)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix_ch12(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix_ch12(n),5)) );
        if ~isempty(xx);
            flag.CH12(xx)=2;
            clear xx
        end
    end
end
if ~isempty(ix.ix_ch13)
    for n=1:length(ix.ix_ch13)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix_ch13(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix_ch13(n),5)) );
        if ~isempty(xx);
            flag.CH13(xx)=2;
            clear xx
        end
    end
end
if ~isempty(ix.ix_ch14)
    for n=1:length(ix.ix_ch14)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix_ch14(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix_ch14(n),5)) );
        if ~isempty(xx);
            flag.CH14(xx)=2;
            clear xx
        end
    end
end

if ~isempty(ix.ix21)
    for n=1:length(ix.ix21)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix21(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix21(n),5)) );
        if ~isempty(xx);
            flag.RH_stab(xx)=2;
            clear xx
        end
    end
end
if ~isempty(ix.ix31)
    for n=1:length(ix.ix31)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix31(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix31(n),5)) );
        if ~isempty(xx);
            flag.RH_stab(xx)=3;
            clear xx
        end
    end
end
if ~isempty(ix.ix41)
    for n=1:length(ix.ix41)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix41(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix41(n),5)) );
        if ~isempty(xx);
            flag.RH_stab(xx)=4;
            clear xx
        end
    end
end
if ~isempty(ix.ix51)
    for n=1:length(ix.ix51)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix51(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix51(n),5)) );
        if ~isempty(xx);
            flag.RH_stab(xx)=5;
            clear xx
        end
    end
end
if ~isempty(ix.ix61)
    for n=1:length(ix.ix61)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix61(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix61(n),5)) );
        if ~isempty(xx);
            flag.RH_stab(xx)=6;
            clear xx
        end
    end
end

if ~isempty(ix.ix22)
    for n=1:length(ix.ix22)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix22(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix22(n),5)) );
        if ~isempty(xx);
            flag.T_stab(xx)=2;
            clear xx
        end
    end
end
if ~isempty(ix.ix32)
    for n=1:length(ix.ix32)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix32(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix32(n),5)) );
        if ~isempty(xx);
            flag.T_stab(xx)=3;
            clear xx
        end
    end
end
if ~isempty(ix.ix42)
    for n=1:length(ix.ix42)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix42(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix42(n),5)) );
        if ~isempty(xx);
            flag.T_stab(xx)=4;
            clear xx
        end
    end
end
if ~isempty(ix.ix52)
    for n=1:length(ix.ix52)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix52(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix52(n),5)) );
        if ~isempty(xx);
            flag.T_stab(xx)=5;
            clear xx
        end
    end
end
if ~isempty(ix.ix62)
    for n=1:length(ix.ix62)
        xx=find((BLH.DT(:,4)==HKD.DT(ix.ix62(n),4)) & (BLH.DT(:,5)==HKD.DT(ix.ix62(n),5)) );
        if ~isempty(xx);
            flag.T_stab(xx)=6;
            clear xx
        end
    end
end