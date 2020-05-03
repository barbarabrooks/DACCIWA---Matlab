function [data]=QC_Davis_AWS_v1(data)

data.flag_TT=ones(length(data.ST),1);
data.flag_RH=ones(length(data.ST),1);
data.flag_PP=ones(length(data.ST),1);
data.flag_WIN=ones(length(data.ST),1);
data.flag_RAD=ones(length(data.ST),1);

ix=find(data.TT>65);
if ~isempty(ix)
    data.flag_TT(ix)=2;%bad data
end
clear ix

ix=find(data.TT<-40);
if ~isempty(ix)
    data.flag_TT(ix)=2;%bad data
end
clear ix

ix=find(data.RH>95);
if ~isempty(ix)
    data.flag_RH(ix)=2;%bad data
end
clear ix

ix=find(data.RH<10);
if ~isempty(ix)
    data.flag_RH(ix)=2;%bad data
end
clear ix

ix=find(data.PP>110000);
if ~isempty(ix)
    data.flag_PP(ix)=2;%bad data
end
clear ix

ix=find(data.PP<54000);
if ~isempty(ix)
    data.flag_PP(ix)=2;%bad data
end
clear ix

ix=find(data.LW>1800);
if ~isempty(ix)
    data.flag_RAD(ix)=2;%LW bad data
end
clear ix

ix=find(data.LW<0);
if ~isempty(ix)
    data.flag_RAD(ix)=2;%bad data
end
clear ix

data.SW_index=data.SW;
data.SW_irrad=data.SW_index./40;

ix=find(data.SW_irrad>0.4);
if ~isempty(ix)
    data.flag_RAD(ix)=3;%bad data
end
clear ix

ix=find(data.SW_irrad<0);
if ~isempty(ix)
    data.flag_RAD(ix)=3;%bad data
end
clear ix

ix=find(data.WS==0);
if ~isempty(ix)
    data.flag_WIN(ix)=2;%wind speed zero 
end
clear ix

ix=find(data.WS<0);
if ~isempty(ix)
    data.flag_WIN(ix)=3;%bad data
end
clear ix

ix=find(data.WS>90);%90 ms-1 max
if ~isempty(ix)
    data.flag_WIN(ix)=3;%bad data
end
clear ix

ix=find(data.WD<0);
if ~isempty(ix)
    data.flag_WIN(ix)=3;%bad data
end
clear ix

%corrrect wind direction to 0 - 359 scale 0 and 360 equivalent
ix=find(data.WD==360);
if ~isempty(ix)
    data.WD(ix)=data.WD(ix).*0;
end

ix=find(data.WD>359);
if ~isempty(ix)
    data.flag_WIN(ix)=3;%bad data
end
clear ix

end

