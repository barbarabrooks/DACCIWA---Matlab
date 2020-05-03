function [WS, WD, U, V]= sodar_fix_5(snws,snwd,sn_z,sows,sowd,so_z)
%snws=sonde3.WS(n,:);
%snwd=sonde3.WD(n,:);
%sn_z=sonde3.Z(n,:);
%sows=data.WS(ix,:);
%sowd=data.WD(ix,:);
%so_z=data.Z(ix,:);

%wind direction
    ix=find((sn_z>=150)&(sn_z<=800));
    sn_wd=mean(snwd(ix));clear ix
    ix=find((so_z>=200)&(so_z<=300));
    w1=sowd(ix);clear ix; 
    ix=find((w1<360)&(w1>0));
    if ~isempty(ix);
        so_wd=mean(w1(ix));
    else
        so_wd=[];
    end;
    clear w1 ix
    if ((~isempty(so_wd))&(~isempty(sn_wd)))
        diff_wd=abs((sn_wd-so_wd));
        if so_wd<sn_wd
            WD=sowd+diff_wd;
        else
            WD=sowd-diff_wd;
        end
        ix=find(WD>=360);
        if ~isempty(ix)
            WD(ix)=WD(ix)-360;
        end
        ix=find(WD>=360);
        if ~isempty(ix)
            WD(ix)=WD(ix).*NaN;
        end
    else
        WS=ones(1,98).*NaN;WD=ones(1,98).*NaN;
    end    
    
%wind speed
    ix=find((sn_z>=30)&(sn_z<=800));
    sn_ws=snws(ix);clear ix
    ix=find((so_z>=30)&(so_z<=800));
    so_ws=sows(ix);clear ix
    if ((~isempty(so_ws))&(~isempty(sn_ws)))
        diff_ws=sn_ws-so_ws;
        ix=find((diff_ws>20)|((diff_ws<-20)));
        if ~isempty(ix);
            diff_ws(ix)=diff_ws(ix).*NaN;
        end;clear ix
        ix=find(~isnan(diff_ws)==1);
        Y=diff_ws(ix);X=so_z(ix);
        [p,f]=polyfit(X,Y,1);
        X2=so_z;
        Y2=polyval(p,X2);
        WS=sows+Y2;
        ix=find((WS>20)|(WS<0));
        if ~isempty(ix)
            WS(ix)=WS(ix).*NaN;
        end
    else
        WS=ones(1,98).*NaN;WD=ones(1,98).*NaN;
    end
    
% components
    [U,V]=uandv(WS,WD);