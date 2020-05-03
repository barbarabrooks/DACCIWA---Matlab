function [WS, WD, U, V]= sodar_fix_5(snws,snwd,sows,sowd)
%snws=sonde3.WS(1,:);
%snwd=sonde3.WD(1,:);
%sows=data.WS(1,:);
%sowd=data.WD(1,:);

%wind direction
    sn_wd=snwd; so_wd=sowd;
    ix=find((so_wd>360)|(so_wd<0));
    if ~isempty(ix);
        so_wd(ix)=so_wd(ix).*NaN;
    end;
    
    if ((~isempty(so_wd))&(~isempty(sn_wd)))
        diffwd=sn_wd-so_wd;
        
        for n=1:length(diffwd)
            if (n>5)&(n<94)
                d=diffwd(n-4:n+4);
            end
            if n<5
                d=diffwd(1:n+4);
            end
            if n>94
                d=diffwd(n-4:98);
            end
        
            ix=find(~isnan(d)==1);
            if ~isempty(ix)
                dd(n)=mean(d(ix));
            else
                dd(n)=NaN;
            end
        end
        
        WD=sowd+dd;
        
        ix=find(WD>=360);
        if ~isempty(ix)
            WD(ix)=WD(ix).*NaN;
        end
        ix=find(WD<0);
        if ~isempty(ix)
            WD(ix)=WD(ix).*NaN;
        end
    else
        WS=ones(1,98).*NaN;WD=ones(1,98).*NaN;
    end    
    
%wind speed
    sn_ws=snws; so_ws=sows;
    ix=find((so_ws>20)|(so_ws<0));
    if ~isempty(ix);
        so_ws(ix)=so_ws(ix).*NaN;
    end;
    
    if ((~isempty(so_ws))&(~isempty(sn_ws)))
        diffws=sn_ws-so_ws;
        
        for n=1:length(diffws)
            if (n>5)&(n<94)
                d=diffws(n-4:n+4);
            end
            if n<5
                d=diffws(1:n+4);
            end
            if n>94
                d=diffws(n-4:98);
            end
        
            ix=find(~isnan(d)==1);
            if ~isempty(ix)
                dd(n)=mean(d(ix));
            else
                dd(n)=NaN;
            end
        end
        
        WS=sows+dd;
       
        ix=find(WS>=20);
        if ~isempty(ix)
            WS(ix)=WS(ix).*NaN;
        end
        ix=find(WS<0);
        if ~isempty(ix)
            WS(ix)=WS(ix).*NaN;
        end
    else
        WS=ones(1,98).*NaN;WD=ones(1,98).*NaN;
    end    
    
% components
    [U,V]=uandv(WS,WD);