function rotate_v1(dn,do)
%dn='E:\WORKING\Flux1\sorted';
%do='E:\WORKING\Flux1\sorted';
list=dir(dn);

for n=3:length(list)
    load(fullfile(dn,list(n).name));
    data.sonic_rotated.DT=data.sonic.DT;
    data.sonic_rotated.T=data.sonic.T;
    data.sonic_rotated.uvw=ones(size(data.sonic.xyz)).*NaN;
    data.sonic_rotated.uvw(:,3)=data.sonic.xyz(:,3);
    
    [WS,WD] = meanwind(data.sonic.xyz(:,1),data.sonic.xyz(:,2));
    
    WD=WD-6;
    ix=find(WD<0);
    if ~isempty(ix)
        WD(ix)=WD(ix)+360;
    end
    
    [data.sonic_rotated.uvw(:,1),data.sonic_rotated.uvw(:,2)]=uandv(WS,WD);
    [data.sonic_meanwinds.WS,data.sonic_meanwinds.WD] = meanwind(data.sonic_rotated.uvw(:,1),data.sonic_rotated.uvw(:,2));
    
    save(fullfile(do,list(n).name),'data','-v7.3');
    
    clear data WS WD
end

