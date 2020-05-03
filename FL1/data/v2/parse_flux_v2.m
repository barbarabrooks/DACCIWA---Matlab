function parse_flux_v2(do,dn)

%do='E:\WORKING\Flux1\sonic\matlab1';
%fn='E:\raw\fluxtower2b\sonic\160611_192039.00.metek';
list=dir(dn);
for n=3:2:length(list)
    temp=list(n).name;
    ix=findstr(temp,'.');
    fn=temp(1:ix(end));
    display(['n=',num2str(n),' ', fn])
    [data.licor]=get_licor_v2(fullfile(dn,[fn,'licor']));
    [data.sonic]=get_sonic_v2(fullfile(dn,[fn,'metek']));
    save(fullfile(do,[fn,'.mat']),'data','-v7.3');
end