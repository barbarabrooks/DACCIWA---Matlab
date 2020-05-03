function meta = get_meta_v4(fn)
%fn='C:\Users\lecbjb\Desktop\Data Project\Stationary\ncas-aws-1\Example META Data File\Meta data_v2.txt';
%this is for tab delimeted meta files
%   Detailed explanation goes here
%input
%   fn: path to metadata file txt format
%   :: separates columns
%Output
%   meta: data structure containing each line of data
%BB January 2017

fid=fopen(fn);
if fid>0
    cc=0;
    while ~feof(fid)
        cc=cc+1;
        X{cc}=fgetl(fid);
    end
    fclose('all');
end

msg='::';
for n=1:length(X)
    temp=X{n};
    ix=strfind(temp,msg);
    if ~isempty(ix)
        meta{n,1}=temp(1:ix(1)-1);
        meta{n,2}=temp(ix(1)+2:end);
    end
end