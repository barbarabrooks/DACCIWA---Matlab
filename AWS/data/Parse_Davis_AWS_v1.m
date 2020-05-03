function Parse_Davis_AWS_v1(din,dout)

list=dir(din);
for n=3:length(list)
    display(['n = ',num2str(n),' ',list(n).name])
    load(fullfile(din,list(n).name));
    
    [data_QC] = QC_Davis_AWS_v1(data);
    save(fullfile(dout,list(n).name),'data_QC');
    
    clear data data_QC
end