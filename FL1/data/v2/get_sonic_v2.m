function [sonic]=get_sonic_v2(fn)

%fn='E:\raw\fluxtower2b\2016-06\160611_212039.00.metek';

fid=fopen(fn);
c=0;
if fid>0
    while ~feof(fid)
        c=c+1;
        data{c}=fgetl(fid);
    end
end
fclose('all');

sonic.DT=ones(length(data),6).*NaN;
sonic.xyz=ones(length(data),3).*NaN;
sonic.T=ones(length(data),1).*NaN;

for n=1:length(data)
    junk=data{n};
    if ((~isempty(junk)) & (length(junk)==68) & (junk(1)=='2')&(~isempty(str2num(junk(1:6)))))
        sonic.DT(n,:)=str2num(junk(1:26));
        if junk(28)=='M'
            temp=str2num(junk(33:39));if ~isempty(temp);sonic.xyz(n,1)=temp./100;end; clear temp
            temp=str2num(junk(43:49));if ~isempty(temp);sonic.xyz(n,2)=temp./100;end; clear temp
            temp=str2num(junk(53:59));if ~isempty(temp);sonic.xyz(n,3)=temp./100;end; clear temp
            temp=str2num(junk(63:end));if ~isempty(temp);sonic.T(n,:)=temp./100;end; clear temp
        end
    end
end
