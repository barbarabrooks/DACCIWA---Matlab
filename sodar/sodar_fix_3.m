load('F:\WORKING\sodar\sond-matrix.mat')
ix=find(sonde3.WD>360);
sonde3.WD(ix)=sonde3.WD(ix).*NaN;
ix=find(sonde3.WD<0);
sonde3.WD(ix)=sonde3.WD(ix).*NaN;

ix=find(sonde3.WS>200);
sonde3.WS(ix)=sonde3.WS(ix).*NaN;
ix=find(sonde3.WS<0);
sonde3.WS(ix)=sonde3.WS(ix).*NaN;

d1='F:\WORKING\sodar\matlab_v2_combined';
d2='F:\WORKING\sodar\matlab_v2_corr';
list1=dir(d1);

for m=3:length(list1)
    load(fullfile(d1,list1(m).name));
    display(['m= ',num2str(m),' ', list1(m).name])
    
    %make neww arrays
    data_old=data;
    data.WS=data.WS.*NaN;
    data.WD=data.WD.*NaN;
    data.U=data.U.*NaN;
    data.V=data.V.*NaN;
    
    sonde4.DT=data.DT;
    sonde4.ET=data.ET;
    sonde4.ST=data.ST;
    sonde4.DoY=data.DoY;
    sonde4.Z=data.Z;
    sonde4.WS=ones(size(data.WS)).*NaN;
    sonde4.WD=ones(size(data.WD)).*NaN;
    sonde4.U=ones(size(data.U)).*NaN;
    sonde4.V=ones(size(data.V)).*NaN;
    
    for n=1:length(data.DoY)
        ix=find((data.DT(n,1)==sonde3.DT(:,1))&(data.DT(n,2)==sonde3.DT(:,2))&(data.DT(n,3)==sonde3.DT(:,3))...
            &(data.DT(n,4)==sonde3.DT(:,4))&(data.DT(n,5)==sonde3.DT(:,5)));
        
        if ~isempty(ix)
            sonde4.WS(n,:)=sonde3.WS(ix,:);
            sonde4.WD(n,:)=sonde3.WD(ix,:);
            sonde4.U(n,:)=sonde3.U(ix,:);
            sonde4.V(n,:)=sonde3.V(ix,:);
        
            [WS,WD,U,V]= sodar_fix_5(sonde4.WS(n,:),sonde4.WD(n,:),...
                data_old.WS(n,:),data_old.WD(n,:));
            
            data.WS(n,:)=WS(1,:);
            data.WD(n,:)=WD(1,:);
            data.U(n,:)=U(1,:);
            data.V(n,:)=V(1,:);
            clear WS WD U V
        end
        clear ix
        
        figure
        subplot(2,1,1)
        plot(sonde4.WS(n,:),sonde4.Z(n,:),'bo',data_old.WS(n,:),data.Z(n,:),'r*',data.WS(n,:),data.Z(n,:),'g^');
        set(gca,'xlim',[0 20]);set(gca,'ylim',[0 800]);
        grid
        
        subplot(2,1,2)
        plot(sonde4.WD(n,:),sonde4.Z(n,:),'bo',data_old.WD(n,:),data.Z(n,:),'r*',data.WD(n,:),data.Z(n,:),'g^');
        set(gca,'xlim',[0 360]);set(gca,'ylim',[0 800]);
        grid
    end
    save(fullfile(d2,list1(m).name),'sonde4','data_old','data','-v7.3');
    clear sonde4 data_old data
end
