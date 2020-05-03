fi='E:\WORKING\AWS\DB_CSV_dump\AWS_data.csv';
dn_xls='E:\WORKING\AWS\xls';
dn_mat='E:\WORKING\AWS\matlab\Initial';
d = {'Year','Month','Day','Hour','Minute','Second','Epoch Time','Serial Time'...
            ,'Day of Year','Pressure','Temperature','Reative Humidity','Wind Speed'...
            ,'Wind Direction','Rate rate','Accumulated Rain','LW radiation'...
            ,'UV index','CIE Weight SW radiation';};
d2= {'','','','','','','seconds since 1970-01-01 00:00:00 UTC','seconds since 0000-01-01 00:00:00 UTC'...
            ,'Day number from: <YYYY>-01-01 00:00:00 UTC','Pa','Degree C','%','m s-1'...
            ,'Degree','mm hr-1','mm'...
            ,'W m-2','','W m-2';};

dd=xlsread(fi);
[ST, JD, DT] = unixtime2mat(dd(:,1));
ix=find((DT(:,2)>=6)&(DT(:,2)<8)&(dd(:,3)==1));
temp(:,1:6)=DT(ix,:);
temp(:,7)=dd(ix,1);%epoch
temp(:,8)=ST(ix);%serial time
temp(:,9)=JD(ix);%DoY
temp(:,10)=dd(ix,5).*(3386.39);%Pressure (Pa)
temp(:,11)=(dd(ix,8)-32).*(5/9);%out T (C)
temp(:,12)=dd(ix,10);%out RH
temp(:,13)=dd(ix,11).*(0.44704);%WS (ms-1)
temp(:,14)=dd(ix,12);%WD (degrees)
temp(:,15)=dd(ix,15).*(25.4);%RR (mm/hr)
temp(:,16)=dd(ix,15).*(25.4)./(60);%(mm accumulataed in 1 minute)%dd(ix,16).*25,4;%accummulated rain incorret
temp(:,17)=dd(ix,21);%LW (Wm-2)
temp(:,18)=dd(ix,22);%uv index
temp(:,19)=dd(ix,22)./40;%CIE Weight UV irradince


clear dd ST DT JD ix
for m=6:7
    for n=1:31
        ix=find((temp(:,2)==m)&(temp(:,3)==n));
        if ~isempty(ix)
            data.DT=temp(ix,1:6);
            data.ET=temp(ix,7);
            data.ST=temp(ix,8);
            data.DoY=temp(ix,9);
            data.PP=temp(ix,10);
            data.TT=temp(ix,11);
            data.RH=temp(ix,12);
            data.WS=temp(ix,13);
            data.WD=temp(ix,14);
            data.RR=temp(ix,15);
            data.AR=temp(ix,16);
            data.LW=temp(ix,17);
            data.UV_index=temp(ix,18);
            data.SW=temp(ix,19);
            
            %save in matlab format
            fn_mat=['AWS_',datestr(data.ST(1),'YYYYmmDD'),'.mat'];
            save(fullfile(dn_mat,fn_mat),'data');
            
            %save xlsx format
            fn_xls=['AWS_',datestr(data.ST(1),'YYYYmmDD'),'.xls'];
            xlswrite(fullfile(dn_xls,fn_xls), d, 1, 'A1');
            xlswrite(fullfile(dn_xls,fn_xls), d2, 1, 'A2');
            xlswrite(fullfile(dn_xls,fn_xls), temp(ix,:), 1, 'A3');
            clear ix data fn.mat fn.xls
        end
    end
end    

