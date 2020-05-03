fsh = 'G:\renfrew\table\data';
do = 'G:\renfrew\table\matlab';
list=dir(fsh);
cc = 0;
%10hz data
dt = datenum(0,0,0,0,0,1)./10;
for n = 3: length(list)
    if (strfind(list(n).name, '_platform') > 1)
        display(list(n).name)
        load(fullfile(fsh,list(n).name));
        mday = MTi.mday(1);
        doy = MTi.doy(1);
        
        for m = 1 : length(MTi.doy)
            mday = mday + dt;
            doy = doy + dt;
            DT = datevec(doy);
            if ((DT(6) > 59.9) || (DT(6) < 0.1)) %found the minute
                cc = cc + 1;
                table.EulerAngle(cc,:) = MTi.EulerAngles(m,:);
                table.RotationRate(cc,:) = MTi.RotationRate(m,:);
                table.doy(cc,1) = doy;
                table.mday(cc,1) = mday;
                table.DT(cc,:) = datevec(mday);
            end
        end
        clear mday doy MTi
    end
end
save(fullfile(do,'IGT_table.mat'),'table')