function Wrapper_MRR_v1(di,do)

list=dir(di); %month
for n=3:length(list)
    list2=dir(fullfile(di,list(n).name));%day
    for m=3:length(list2)
        display(['m= ',num2str(m),' ',list2(m).name])
        [data_out,fo]=parse_MRR_v1(fullfile(di,fullfile(list(n).name,list2(m).name)));
        [data]=QC_MRR_v1(data_out);
        save(fullfile(do,fo),'data','-v7.3');
        clear data_out data fo
    end
    clear list2 m
end
clear list n di do