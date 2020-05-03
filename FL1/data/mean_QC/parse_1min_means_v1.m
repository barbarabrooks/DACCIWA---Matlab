function parse_1min_means_v1(dn,do)
%dn='E:\WORKING\Flux1\sorted';
%do='E:\WORKING\Flux1\1_min\matlab';
list=dir(dn);

for n=47:length(list)
    load(fullfile(dn,list(n).name));
    din=data;clear data
    
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
    data.licor.mean_DPT=ones(24*60,1).*NaN;
    data.licor.std_DPT=ones(24*60,1).*NaN;
    data.licor.mean_PP=ones(24*60,1).*NaN;
    data.licor.std_PP=ones(24*60,1).*NaN;
    data.licor.mean_CO2=ones(24*60,3).*NaN;
    data.licor.std_CO2=ones(24*60,3).*NaN;
    data.licor.mean_H2O=ones(24*60,3).*NaN;
    data.licor.std_H2O=ones(24*60,3).*NaN;
    
    %time
    data.DT(:,1)=data.DT(:,1).*din.sonic_rotated.DT(1,1);
    data.DT(:,2)=data.DT(:,2).*din.sonic_rotated.DT(1,2);
    data.DT(:,3)=data.DT(:,3).*din.sonic_rotated.DT(1,3);
    data.DT(:,6)=data.DT(:,6).*0;
    
    cc=0;
    for m=0:23
        for nm=0:59
            cc=cc+1;
            data.DT(cc,4)=m;data.DT(cc,5)=nm;
            %sonic
            ix=find( (din.sonic_rotated.DT(:,4)==m)&(din.sonic_rotated.DT(:,5)==nm) );
            if ~isempty(ix)
                %UVW
                temp=din.sonic_rotated.uvw(ix,:);
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
                temp=din.sonic_rotated.T(ix);
                ix1=find(~isnan(temp)==1);
                if ~isempty(ix1)
                    data.sonic.mean_T(cc)=mean(temp(ix1));
                    data.sonic.std_T(cc)=std(temp(ix1));
                end
                clear ix1 temp
                %horizontal
                [data.sonic.mean_WS(cc),data.sonic.mean_WD(cc)] = meanwind(data.sonic.mean_uvw(cc,1),data.sonic.mean_uvw(cc,2));
               
                temp=din.sonic_rotated.uvw(ix,:);
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
            ix=find( (din.licor.DT(:,4)==m)&(din.licor.DT(:,5)==nm) );
            if ~isempty(ix)
                temp=din.licor.T(ix);
                ix1=find(~isnan(temp(:,1))==1);
                if ~isempty(ix1)
                    data.licor.mean_T(cc)=mean(temp(ix1));
                    data.licor.std_T(cc)=std(temp(ix1));
                end
                clear ix1 temp
                temp=din.licor.DPT(ix);
                ix1=find(~isnan(temp(:,1))==1);
                if ~isempty(ix1)
                    data.licor.mean_DPT(cc)=mean(temp(ix1));
                    data.licor.std_DPT(cc)=std(temp(ix1));
                end
                clear ix1 temp
                temp=din.licor.PP(ix);
                ix1=find(~isnan(temp(:,1))==1);
                if ~isempty(ix1)
                    data.licor.mean_PP(cc)=mean(temp(ix1));
                    data.licor.std_PP(cc)=std(temp(ix1));
                end
                clear ix1 temp
                %CO2
                temp=din.licor.CO2(ix,:);
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
                ix1=find(~isnan(temp(:,3))==1);
                if ~isempty(ix1)
                    data.licor.mean_CO2(cc,3)=mean(temp(ix1,3));
                    data.licor.std_CO2(cc,3)=std(temp(ix1,3));
                end
                clear ix1 temp
                %H2O
                temp=din.licor.H2O(ix,:);
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
                ix1=find(~isnan(temp(:,3))==1);
                if ~isempty(ix1)
                    data.licor.mean_H2O(cc,3)=mean(temp(ix1,3));
                    data.licor.std_H2O(cc,3)=std(temp(ix1,3));
                end
                clear ix1 temp
            end    
        end         
    end         
            
    save(fullfile(do,list(n).name),'data','-v7.3');
    
    clear data WS WD
end