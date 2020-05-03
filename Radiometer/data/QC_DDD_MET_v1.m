function [flag]=QC_DDD_MET_v1(DDD,ix)
rain_flag=DDD.flag;

%1=good data
flag.T=ones(size(DDD.DoY));flag.PP=ones(size(DDD.DoY));flag.RH=ones(size(DDD.DoY));flag.RAIN=DDD.flag;

xx=find(rain_flag==1);
if ~isempty(xx)
    flag.RAIN(xx)=2;
    clear xx
end
xx=find(rain_flag==0);
if ~isempty(xx)
    flag.RAIN(xx)=1;
    clear xx
end
if ~isempty(ix.ix_temperature)
    flag.T(ix_temperature)=2;
end
if ~isempty(ix.ix_pressure)
    flag.PP(ix_pressure)=2;
end
if ~isempty(ix.ix_rh)
    flag.rh(ix.ix_rh)=2;
end
