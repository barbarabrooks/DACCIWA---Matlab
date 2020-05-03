function [bck]=QC_sodar_BCK_v1(d)

bck=ones(size(d.B));

%deband backscatter
%[d.B]=despike_sodar_219_mnd_v1(d.B,d.err_code);
%[d.B_avg]=despike_sodar_219_mnd_v1(d.B_avg,d.err_code);
%[d.B_bck]=despike_sodar_219_mnd_v1(d.B_bck,d.err_code);

bck=ones(size(d.B));
ix=find(d.err_code>7);
if ~isempty(ix)
    bck(ix)=3;
end

ix=find(log10(d.B_avg)>5);
if ~isempty(ix)
    bck(ix)=2;
end
clear ix

