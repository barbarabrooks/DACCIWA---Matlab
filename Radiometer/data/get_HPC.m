function [data]=get_HPC(fi)
data.z=dlmread(fi,',',[7 0 7 92]); 

fid=fopen(fi);
if fid>0
    cc=0;c=0;
    while ~feof(fid)
        cc=cc+1;
        junk=fgetl(fid);
        if strcmp('#',junk(1))
            c=c+1;
            ix(c)=cc;
        end
    end;
    fclose(fid);
    temp1=dlmread(fi,',',[ix(2) 0 ix(3)-4 99]);
    [r,c]=size(temp1);
    temp2=dlmread(fi,',',[ix(3) 0 ix(3)+r-1 99]);
    
    data.DT=temp1(:,1:6);
    data.DT(:,1)=data.DT(:,1)+2000;
    data.flag=temp1(:,7);
    data.abh=temp1(:,8:c);
    data.rh=temp2(:,8:c);

end
