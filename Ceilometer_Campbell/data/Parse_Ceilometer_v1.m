function [data]=Parse_Ceilometer_v1(dn) % parse a day pf data
%dn='D:\temp\20160630';
list=dir(dn);

for n=3:length(list)
    display(['n= ',num2str(n),' ',list(n).name])
    [d]=get_ceilometer_file_v1(fullfile(dn,list(n).name));
    if n==3
        data=d;
    else
        data.DT=[data.DT;d.DT];
        data.DoY=[data.DoY;d.DoY];
        data.ET=[data.ET;d.ET];
        data.ST=[data.ST;d.ST];
        data.BB=[data.BB;d.BB];
        data.ZZ=[data.ZZ;d.ZZ];
        data.no_gates=[data.no_gates;d.no_gates];
        data.gate_res=[data.gate_res;d.gate_res];
    end
    clear d
end

[data]=QC_ceilometer_v1(data);