function write_NC_data_MRR_profiles(fn_nc, data, meta)
%get rid of NaN
    ix=find(isnan(data.F)==1);
    if ~isempty(ix)
        data.F(ix)=-1e20;   
    end
    
    ix=find(isnan(data.D)==1);
    if ~isempty(ix)
        data.D(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.N)==1);
    if ~isempty(ix)
        data.N(ix)=-1e20;   
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
    xx=data.H(1,:)+x;
    nc_varput(fn_nc,'altitude',xx);
    yy=(0:63);
    nc_varput(fn_nc,'spectral_bin',yy);
    nc_varput(fn_nc,'spectral_reflectivity',data.F);
    nc_varput(fn_nc,'rain_drop_diameter',data.D);
    nc_varput(fn_nc,'drop_size_distribution',data.N);
    nc_varput(fn_nc,'qc_flag',data.flag.spec);
    
    