%function [in,pl,dp,ver,st]=NC_file_name_parts_v4(meta)
in='';pl='';dp='';ver='';st='';

%get filenaming information
for n=1:length(meta)
    if (strfind(meta{n,1},'instrument_name'))
        in=lower(meta{n,2});
        
    end
    if (strfind(meta{n,1},'platform_name'))
        pl=lower(meta{n,2});
    end
    if (strfind(meta{n,1},'data_product')) 
        if (strfind(meta{n,1},'data_product_level'))
        else
            dp=lower(meta{n,2});
        end
    end
    if (strfind(meta{n,1},'data_set_version'))
        ver=lower(meta{n,2});
    end
    if (strfind(meta{n,1},'scan_type'))
        st=lower(meta{n,2});
    end
    
end