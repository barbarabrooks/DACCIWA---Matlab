function [d1]=flux_stats_v2(runs,sf,Z)
[rr,xx]=size(runs.sonic.Ts);

for cc=1:rr
    u=reshape(runs.sonic.xyz_rotated(cc,:,1),xx,1);
    ix=find(~isnan(u)==1);u=u(ix);clear ix
    
    v=reshape(runs.sonic.xyz_rotated(cc,:,2),xx,1);
    ix=find(~isnan(v)==1);v=v(ix);clear ix
    
    w=reshape(runs.sonic.xyz_rotated(cc,:,3),xx,1);
    ix=find(~isnan(w)==1);w=w(ix);clear ix
    
    Ts=runs.sonic.Ts(cc,:)+273.15;
    ix=find(~isnan(Ts)==1);Ts=Ts(ix);Ts=Ts';clear ix
    
    [QC,flag] = fluxQC_v2(u,v,w,Ts,sf,Z);%no surface displacement
    
    d1.skew_w(cc,1)=QC.skew_w;d1.kurtosis_w(cc,1)=QC.kurtosis_w;
    d1.skew_u(cc,1)=QC.skew_u;d1.kurtosis_u(cc,1)=QC.kurtosis_u;
    d1.skew_v(cc,1)=QC.skew_v;d1.kurtosis_v(cc,1)=QC.kurtosis_v;
    d1.skew_T(cc,1)=QC.skew_Ts;d1.kurtosis_T(cc,1)=QC.kurtosis_Ts;
    d1.sst_wu(cc,1)=QC.sst_wu;d1.sst_wv(cc,1)=QC.sst_wv;d1.sst_wt(cc,1)=QC.sst_wt;
    d1.ustar(cc,1)= QC.ustar;d1.L(cc,1)=QC.L;d1.ZoverL(cc,1)=QC.ZoverL;
    d1.sigma_w(cc,1)=QC.sigma_w;d1.itc_w(cc,1)=QC.itc_w;
            
    d1.flag.skew_w(cc,1)=flag.skew_w;d1.flag.kurtosis_w(cc,1)=flag.kurtosis_w;
    d1.flag.skew_u(cc,1)=flag.skew_u;d1.flag.kurtosis_u(cc,1)=flag.kurtosis_u;
    d1.flag.skew_v(cc,1)=flag.skew_v;d1.flag.kurtosis_v(cc,1)=flag.kurtosis_v;
    d1.flag.skew_T(cc,1)=flag.skew_Ts;d1.flag.kurtosis_T(cc,1)=flag.kurtosis_Ts;
    d1.flag.sstclass_wu(cc,1)=flag.sstclass_wu;d1.flag.sstclass_wv(cc,1)=flag.sstclass_wv;
    d1.flag.sstclass_wt(cc,1)=flag.sstclass_wt;d1.flag.itc_class(cc,1)=flag.itc_class;
    d1.flag.quality_wu(cc,1)=flag.quality_wu;d1.flag.quality_wv(cc,1)=flag.quality_wv;
    d1.flag.quality_wt(cc,1)=flag.quality_wt;
    clear QC flag
    
    CO2=reshape(runs.licor.CO2(cc,:,1),xx,1);
    ix=find(~isnan(CO2(:,1))==1);
    H2O=reshape(runs.licor.H2O(cc,:,1),xx,1);
    ix1=find(~isnan(H2O(:,1))==1);
    d1.skew_CO2(cc,1)=skew(detrend(CO2(ix,1)));d1.kurtosis_CO2(cc)=kurtosis(detrend(CO2(ix)));
    d1.skew_H2O(cc,1)=skew(detrend(H2O(ix1,1)));d1.kurtosis_H2O(cc)=kurtosis(detrend(H2O(ix1))); 
end       