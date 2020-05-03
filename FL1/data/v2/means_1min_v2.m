function [data] = means_1min_v2(sonic,licor,water)

    %create arrays
    %sonic
    data.DT=ones(24*60,6);
    data.sonic.mean_T=ones(24*60,1).*NaN;
    data.sonic.std_T=ones(24*60,1).*NaN;
    data.sonic.mean_uvw=ones(24*60,3).*NaN;
    data.sonic.std_uvw=ones(24*60,3).*NaN;
    data.sonic.mean_WS=ones(24*60,1).*NaN;
    data.sonic.mean_WD=ones(24*60,1).*NaN;
    data.sonic.gust_WS=ones(24*60,2).*NaN;
    data.sonic.gust_WD=ones(24*60,2).*NaN;
    %licor
    data.licor.mean_T=ones(24*60,1).*NaN;
    data.licor.std_T=ones(24*60,1).*NaN;
    data.licor.mean_PP=ones(24*60,1).*NaN;
    data.licor.std_PP=ones(24*60,1).*NaN;
    data.licor.mean_CO2=ones(24*60,2).*NaN;
    data.licor.std_CO2=ones(24*60,2).*NaN;
    data.licor.mean_H2O=ones(24*60,2).*NaN;
    data.licor.std_H2O=ones(24*60,2).*NaN;
    %water
    data.water.mean_Q=ones(24*60,1).*NaN;
    data.water.std_Q=ones(24*60,1).*NaN;
    data.water.mean_WVMMR=ones(24*60,2).*NaN;
    data.water.std_WVMMR=ones(24*60,2).*NaN;
    data.water.mean_T=ones(24*60,1).*NaN;
    data.water.std_T=ones(24*60,1).*NaN;
    data.water.mean_PPwet=ones(24*60,1).*NaN;
    data.water.std_PPwet=ones(24*60,1).*NaN;
    
    %time
    data.DT(:,1)=data.DT(:,1).*sonic.DT(1,1);
    data.DT(:,2)=data.DT(:,2).*sonic.DT(1,2);
    data.DT(:,3)=data.DT(:,3).*sonic.DT(1,3);
    data.DT(:,6)=data.DT(:,6).*0;
    
    cc=0;
    for m=0:23
        for nm=0:59
            cc=cc+1;
            data.DT(cc,4)=m;data.DT(cc,5)=nm;
            %sonic
            ix=find( (sonic.DT(:,4)==m)&(sonic.DT(:,5)==nm) );
            if ~isempty(ix)
                %UVW
                temp=sonic.earth_xyz(ix,:);
                ix1=find(~isnan(temp(:,1))==1);
                if ~isempty(ix1)
                    data.sonic.mean_uvw(cc,1)=mean(temp(ix1,1));
                    data.sonic.std_uvw(cc,1)=std(temp(ix1,1));
                end
                clear ix1
                ix1=find(~isnan(temp(:,2))==1);
                if ~isempty(ix1)
                    data.sonic.mean_uvw(cc,2)=mean(temp(ix1,2));
                    data.sonic.std_uvw(cc,2)=std(temp(ix1,2));
                end
                clear ix1
                ix1=find(~isnan(temp(:,3))==1);
                if ~isempty(ix1)
                    data.sonic.mean_uvw(cc,3)=mean(temp(ix1,3));
                    data.sonic.std_uvw(cc,3)=std(temp(ix1,3));
                end
                clear ix1 temp
                %temperature    
                temp=sonic.Ts(ix);
                ix1=find(~isnan(temp)==1);
                if ~isempty(ix1)
                    data.sonic.mean_T(cc)=mean(temp(ix1));
                    data.sonic.std_T(cc)=std(temp(ix1));
                end
                clear ix1 temp
                %horizontal
                [data.sonic.mean_WS(cc),data.sonic.mean_WD(cc)] = meanwind(data.sonic.mean_uvw(cc,1),data.sonic.mean_uvw(cc,2));
               
                temp=sonic.earth_xyz(ix,:);
                [mnws,mnwd] = meanwind(temp(:,1),temp(:,2));
                data.sonic.gust_WS(cc,1)=min(mnws);
                data.sonic.gust_WS(cc,2)=max(mnws);
                ix=find(mnws==min(mnws));
                if ~isempty(ix)
                    data.sonic.gust_WD(cc,1)=mnwd(ix(1));
                end
                clear ix
                ix=find(mnws==max(mnws));
                if ~isempty(ix)
                    data.sonic.gust_WD(cc,2)=mnwd(ix(1));
                end
                clear ix
            end
            clear ix
            %licor
            ix=find( (licor.DT(:,4)==m)&(licor.DT(:,5)==nm) );
            if ~isempty(ix)
                temp=licor.T(ix);
                ix1=find(~isnan(temp(:,1))==1);
                if ~isempty(ix1)
                    data.licor.mean_T(cc)=mean(temp(ix1));
                    data.licor.std_T(cc)=std(temp(ix1));
                end
                clear ix1 temp
             
                temp=licor.PP(ix);
                ix1=find(~isnan(temp(:,1))==1);
                if ~isempty(ix1)
                    data.licor.mean_PP(cc)=mean(temp(ix1));
                    data.licor.std_PP(cc)=std(temp(ix1));
                end
                clear ix1 temp
                %CO2
                temp=licor.CO2(ix,:);
                ix1=find(~isnan(temp(:,1))==1);
                if ~isempty(ix1)
                    data.licor.mean_CO2(cc,1)=mean(temp(ix1,1));
                    data.licor.std_CO2(cc,1)=std(temp(ix1,1));
                end
                clear ix1
                ix1=find(~isnan(temp(:,2))==1);
                if ~isempty(ix1)
                    data.licor.mean_CO2(cc,2)=mean(temp(ix1,2));
                    data.licor.std_CO2(cc,2)=std(temp(ix1,2));
                end
                clear ix1
                
                %H2O
                temp=licor.H2O(ix,:);
                ix1=find(~isnan(temp(:,1))==1);
                if ~isempty(ix1)
                    data.licor.mean_H2O(cc,1)=mean(temp(ix1,1));
                    data.licor.std_H2O(cc,1)=std(temp(ix1,1));
                end
                clear ix1
                ix1=find(~isnan(temp(:,2))==1);
                if ~isempty(ix1)
                    data.licor.mean_H2O(cc,2)=mean(temp(ix1,2));
                    data.licor.std_H2O(cc,2)=std(temp(ix1,2));
                end
                clear ix1
                %specific humidity
                temp=water.Q(ix);
                ix1=find(~isnan(temp)==1);
                if ~isempty(ix1)
                    data.water.mean_Q(cc)=mean(temp(ix1));
                    data.water.std_Q(cc)=std(temp(ix1));
                end
                clear ix1
                %mass mixing ratios 1 - licor temperature , 2 - sonic
                %temperature corrected for Q
                temp=water.Mmr_licor(ix);
                ix1=find(~isnan(temp)==1);
                if ~isempty(ix1)
                    data.water.mean_WVMMR(cc,1)=mean(temp(ix1));
                    data.water.std_WVMMR(cc,1)=std(temp(ix1));
                end
                clear ix1
                temp=water.Mmr_sonic(ix);
                ix1=find(~isnan(temp)==1);
                if ~isempty(ix1)
                    data.water.mean_WVMMR(cc,2)=mean(temp(ix1));
                    data.water.std_WVMMR(cc,2)=std(temp(ix1));
                end
                clear ix1
                %sonic temperature corrected for specific humidity
                temp=water.Ts(ix);
                ix1=find(~isnan(temp)==1);
                if ~isempty(ix1)
                    data.water.mean_T(cc)=mean(temp(ix1));
                    data.water.std_T(cc)=std(temp(ix1));
                end
                clear ix1
                %water vapour partial pressure (Pa)
                temp=water.PPwet(ix);
                ix1=find(~isnan(temp)==1);
                if ~isempty(ix1)
                    data.water.mean_PPwet(cc)=mean(temp(ix1));
                    data.water.std_PPwet(cc)=std(temp(ix1));
                end
                clear ix1
            end    
        end         
    end         
end