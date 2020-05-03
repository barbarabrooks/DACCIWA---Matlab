function write_NC_header_v4(fn_nc, meta, data)
%write the global attributes starting at conventions
for n = 1 : length(meta)
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),meta{n,1},meta{n,2});
    
    if (strfind(meta{n,1},'instrument_serial_number'))
        nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),meta{n,1},['RS41 sonde serial number: ',data.SN]);     
    end
    
    if (strfind(meta{n,1},'time_coverage_start'))
        nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),meta{n,1},...
            datestr((min(data.ET)./86400 + datenum(1970,1,1,0,0,0)),'YYYY-mm-DDTHH:MM:SS'));     
    end
    
    if (strfind(meta{n,1},'time_coverage_end'))
        nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),meta{n,1},...
            datestr((max(data.ET)./86400 + datenum(1970,1,1,0,0,0)),'YYYY-mm-DDTHH:MM:SS'));     
    end
    
    if (strfind(meta{n,1},'geospatial_bounds'))
        lat=num2str(data.LAT(1));
        lon=num2str(data.LON(1));
        sl=[lat,'N ',lon,'E'];
        nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),meta{n,1},sl);     
    end
    
    
    if (strfind(meta{n,1},'last_revised_date'))
        nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),meta{n,1},datestr(now,'YYYY-mm-DDTHH:MM:SS'));
    end
end