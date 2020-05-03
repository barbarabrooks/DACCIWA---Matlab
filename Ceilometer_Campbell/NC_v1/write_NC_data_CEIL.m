function write_NC_data_CEIL(fn_nc, meta, data)
%get rid of NaN
    ix=find(isnan(data.ZZ)==1);
    if ~isempty(ix)
        data.ZZ(ix)=-1e20;   
    end
    
    ix=find(isnan(data.BB)==1);
    if ~isempty(ix)
        data.BB(ix)=-1e20;   
    end
    clear ix
    
%Save data
    nc_varput(fn_nc,'time',data.ET);
    nc_varput(fn_nc,'alt_time',data.ST);
    nc_varput(fn_nc,'day_of_year',data.DoY);
    nc_varput(fn_nc,'year',data.DT(:,1));
    nc_varput(fn_nc,'month',data.DT(:,2));
    nc_varput(fn_nc,'day',data.DT(:,3));
    nc_varput(fn_nc,'hour',data.DT(:,4));
    nc_varput(fn_nc,'minute',data.DT(:,5));
    nc_varput(fn_nc,'second',data.DT(:,6));
    nc_varput(fn_nc,'latitude',meta.LAT);
    nc_varput(fn_nc,'longitude',meta.LON);
    ix=strfind(meta.l34,'m');
    x=str2num(meta.l34(1:ix-1));
    xx=data.ZZ(1,:)+x;
    nc_varput(fn_nc,'altitude',xx);
    nc_varput(fn_nc,'aerosol_backscatter_coefficient',data.BB);
    nc_varput(fn_nc,'qc_flag',data.flag);
    
    