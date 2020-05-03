function create_daily_files_v1(dn, do)
%dn='E:\WORKING\Flux1\raw';
%do='E:\WORKING\Flux1\sorted';
list=dir(dn);

temp=list(3).name;
year=temp(1:2);
st_month=str2num(temp(3:4));
clear temp
temp=list(end-1).name;
ed_month=str2num(temp(3:4));
clear temp

for n=st_month:ed_month
    for m=1:eomday(2000+str2num(year),n)
        file_list=[];
        for mm=0:23
            target=year;
            if n<10
                target=[target,'0',num2str(n)];
            else
                target=[target,num2str(n)];
            end
            if m<10
                target=[target,'0',num2str(m)];
            else
                target=[target,num2str(m)];
            end
            if mm<10
                target=[target,'_0',num2str(mm)];
            else
                target=[target,'_',num2str(mm)];
            end
        
            for nn=3:length(list)-1
                temp=list(nn).name;
                if strcmp(target,temp(1:9))
                    file_list=[file_list;nn];
                end
            end
            clear target
        end
        
        if ~isempty(file_list)
            if file_list(end)~=length(list)-1
                file_list=[file_list;(file_list(end)+1)];
            end
        
            sonic.DT=[];sonic.T=[];sonic.xyz=[];
            licor.DT=[];licor.T=[];licor.DPT=[];licor.PP=[];licor.CoolerV=[];licor.CO2=[];licor.H2O=[];
            for nn=1:length(file_list)
                load(fullfile(dn,list(file_list(nn)).name));
                sonic.DT=[sonic.DT;data.sonic.DT];
                sonic.T=[sonic.T;data.sonic.T];
                sonic.xyz=[sonic.xyz;data.sonic.xyz];
            
                licor.DT=[licor.DT;data.licor.DT];
                licor.T=[licor.T;data.licor.TT];
                licor.DPT=[licor.DPT;data.licor.DPT];
                licor.PP=[licor.PP;data.licor.PP];
                licor.CoolerV=[licor.CoolerV;data.licor.CoolerV];
                licor.CO2=[licor.CO2;data.licor.CO2];
                licor.H2O=[licor.H2O;data.licor.H2O];
                clear data
            end 
            ix=find((sonic.DT(:,2)==n) & (sonic.DT(:,3)==m));
            if ~isempty(ix)
                data.sonic.DT=sonic.DT(ix,:);
                data.sonic.xyz=sonic.xyz(ix,:);
                data.sonic.T=sonic.T(ix,1);        
            end
            clear ix
            ix=find((licor.DT(:,2)==n) & (licor.DT(:,3)==m));
            if ~isempty(ix)
                data.licor.DT=licor.DT(ix,:);
                data.licor.T=licor.T(ix,1);
                data.licor.DPT=licor.DPT(ix,1);
                data.licor.DT=licor.DT(ix,:);
                data.licor.PP=licor.PP(ix,1);
                data.licor.CoolerV=licor.CoolerV(ix,1);
                data.licor.CO2=licor.CO2(ix,:);
                data.licor.H2O=licor.H2O(ix,:);
            end
            if ((~isempty(data.sonic.DT))|(~isempty(data.licor.DT)))
                fo=['20',year];
                if n<10
                    fo=[fo,'0',num2str(n)];
                else
                    fo=[fo,num2str(n)];
                end
                if m<10
                    fo=[fo,'0',num2str(m)];
                else
                    fo=[fo,num2str(m)];
                end
                fo=[fo,'.mat'];
                display(fo);
                save(fullfile(do,fo),'data','-v7.3')
                clear data fo   
            end
        end    
    end
end