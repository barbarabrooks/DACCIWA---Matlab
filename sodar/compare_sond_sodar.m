d1='F:\WORKING\Sondes\matlab';
d2='F:\WORKING\sodar\matlab_v2_combined';
list1=dir(d1);
list2=dir(d2);

sonde.DT=ones(length(list1)-2,6);
sonde.Z=ones(length(list1)-2,200).*NaN;
sonde.WS=ones(length(list1)-2,200).*NaN;
sonde.WD=ones(length(list1)-2,200).*NaN;
sonde.U=ones(length(list1)-2,200).*NaN;
sonde.V=ones(length(list1)-2,200).*NaN;

for n=3:length(list1)
    load(fullfile(d1,list1(n).name));
    sonde.DT(n-2,:)=data.DT(1,:);
    ws=data.WS;wd=data.WD;z=data.Altitude;z=data.Altitude;
    %start height at Zero
    zz=z-z(1);clear z
    %find 510
    ix1=find(zz>=30);
    ix2=find(zz>=510);
    z=zz(ix1(1):ix2(1));ws=ws(ix1(1):ix2(1));wd=wd(ix1(1):ix2(1));[u,v]=uandv(ws,wd);
    sonde.Z(n-2,1:length(z))=z;
    sonde.WS(n-2,1:length(ws))=ws;
    sonde.WD(n-2,1:length(wd))=wd;
    sonde.U(n-2,1:length(u))=u;
    sonde.V(n-2,1:length(v))=v;
    
    clear data z ws wd u v ix1 ix2
end
[xx,~]=size(sonde.WS);
sodar.DT=ones(size(sonde.DT));
sodar.Z=ones(length(list1)-2,98).*NaN;
sodar.WS=ones(length(list1)-2,98).*NaN;
sodar.WD=ones(length(list1)-2,98).*NaN;
sodar.U=ones(length(list1)-2,98).*NaN;
sodar.V=ones(length(list1)-2,98).*NaN;
for n=1:xx
    for m=3:length(list2)
        load(fullfile(d2,list2(m).name));
        %data withthe same month day and hour
        ix=find( (data.DT(:,2)==sonde.DT(n,2))&(data.DT(:,3)==sonde.DT(2,3))&(data.DT(:,4)==sonde.DT(n,4)));
        if ~isempty(ix)
            sodar.DT(n,:)=data.DT(ix(1),:);
            sodar.Z(n,:)=data.Z(ix(1),:);
            sodar.WS(n,:)=data.WS(ix(1),:);
            sodar.WD(n,:)=data.WD(ix(1),:);
            sodar.U(n,:)=data.U(ix(1),:);
            sodar.V(n,:)=data.V(ix(1),:);
            break
        end
        clear data
    end
end