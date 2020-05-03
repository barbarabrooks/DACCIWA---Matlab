function [ws]=QC_sodar_winds_v1(d)

ws=ones(size(d.WS));

ix=find(d.err_code>7);
ws(ix)=4;
    
%wind speed > 20 ms-1
ix=find((d.WS>20)|(d.WS<0));
if ~isempty(ix)
    ws(ix)=2;
end
clear ix

%wind speed == 0
ix=find(d.WS==0);
if ~isempty(ix)
    ws(ix)=3;
end
clear ix

