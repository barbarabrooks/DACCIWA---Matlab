load('F:\WORKING\sodar\sond-sodar.mat')
[x,~]=size(sonde2.Z);
for n=1:x
    %wind direction
    ix=find((sonde2.Z(n,:)>=200)&(sonde2.Z(n,:)<=300));
    sn_wd=mean(sonde2.WD(n,ix));clear ix
    ix=find((sodar.Z(n,:)>=200)&(sodar.Z(n,:)<=300));
    w1=sodar.WD(n,ix);clear ix; ix=find((w1<360)&(w1>0));if ~isempty(ix);so_wd=mean(w1(ix));end;clear w1 ix
    diff_wd=abs((sn_wd-so_wd));
    if so_wd<sn_wd
        WD=sodar.WD(n,:)+diff_wd;
    else
        WD=sodar.WD(n,:)-diff_wd;
    end
    ix=find(WD>=360);
    if ~isempty(ix)
        WD(ix)=WD(ix)-360;
    end
    ix=find(WD>=360);
    if ~isempty(ix)
        WD(ix)=WD(ix).*NaN;
    end
    
    %wind speed
    ix=find((sonde2.Z(n,:)>=30)&(sonde2.Z(n,:)<=800));
    sn_ws=sonde2.WS(n,ix);clear ix
    ix=find((sodar.Z(n,:)>=30)&(sodar.Z(n,:)<=800));
    so_ws=sodar.WS(n,ix);clear ix
    if ((~isempty(so_ws))&(~isempty(sn_ws)))
        diff_ws=sn_ws-so_ws;
        ix=find((diff_ws>20)|((diff_ws<-20)));if ~isempty(ix);diff_ws(ix)=diff_ws(ix).*NaN;end;clear ix
        ix=find(~isnan(diff_ws)==1);
        Y=diff_ws(ix);X=sodar.Z(n,ix);
        [p,f]=polyfit(X,Y,1);
        X2=sodar.Z(n,:);
        Y2=polyval(p,X2);
        WS=sodar.WS(n,:)+Y2;
        ix=find((WS>20)|(WS<0));
        if ~isempty(ix)
            WS(ix)=WS(ix).*NaN;
        end
    else
        WS=ones(1,98).*NaN;WD=ones(1,98).*NaN;
        U=ones(1,98).*NaN; V=ones(1,98).*NaN;
    end
    sodar2.WD(n,:)=WD;
    sodar2.WS(n,:)=WS;
    [sodar2.U(n,:),sodar2.V(n,:)]=uandv(WS,WD);
    
    figure
    subplot(2,1,1)
    plot(sonde2.WS(n,:),sonde2.Z(n,:),'r');hold
    plot(sodar.WS(n,:),sodar.Z(n,:),'b*');
    plot(WS,sodar.Z(n,:),'mo');
    set(gca,'xlim',[0 20])
    grid
    
    subplot(2,1,2)
    plot(sonde2.WD(n,:),sonde2.Z(n,:),'r');hold
    plot(sodar.WD(n,:),sodar.Z(n,:),'b*');
    plot(WD,sodar.Z(n,:),'mo');
    set(gca,'xlim',[0 360])
    grid
end