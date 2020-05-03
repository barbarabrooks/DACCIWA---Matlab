function NC_Wrapper_CEIL(dn,do,fn_meta)

% Wrapper to create NC files for pro
%input
%   dn: directory holding the matlab files
%   do: directory for nc files
%   fn_meta: full path to project meta file
%
% ncas-aws-<n>_<platform_name>_<YYYYMMDD>_<data_product>_<version>.nc
%BB 23/06/2016

f1='ncas-ceil-1_';
f4='backscatter_';
f6='.nc';

meta=get_meta_CEIL(fn_meta);
ix=strfind(meta.l28,' ');
if ~isempty(ix)
    xx=meta.l28;
    xx(ix)='-';
else
    xx=meta.l28;
end

f2=[lower(xx),'_'];clear xx

f5=['v',meta.l19];
clear meta

list=dir(dn);
for n=3:length(list)
    temp=list(n).name;
    ix=strfind(temp,'.');
    f3=[temp(ix-8:ix-1),'_'];
    clear temp
    fc=[f1,f2,f3,f4,f5,f6];
    write_NC_CEIL(fullfile(do,fc),fullfile(dn,list(n).name),fn_meta);
    clear fc temp ix f3
end

end