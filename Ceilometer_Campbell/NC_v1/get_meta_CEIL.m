function meta = get_meta_CEIL(fn)

%   Detailed explanation goes here
%input
%   fn: path to metadata file
%Output
%   meta: data structure containing each line of data
%BB July 2016
fid=fopen(fn);
if fid>0
    cc=0;
    while ~feof(fid)
        junk=fgetl(fid);
        ix=strfind(junk,':');
        if ~isempty(ix)
            cc=cc+1;
            temp=junk(ix+1:end);
        end
        if cc==1;meta.l1=temp;end;
        if cc==2;meta.l2=temp;end;
        if cc==3;meta.l3=temp;end;
        if cc==4;meta.l4=temp;end;
        if cc==5;meta.l5=temp;end;
        if cc==6;meta.l6=temp;end;
        if cc==7;meta.l7=temp;end;
        if cc==8;meta.l8=temp;end;
        if cc==9;meta.l9=temp;end;
        if cc==10;meta.l10=temp;end;
        if cc==11;meta.l11=temp;end;
        if cc==12;meta.l12=temp;end;
        if cc==13;meta.l13=temp;end;
        if cc==14;meta.l14=temp;end;
        if cc==15;meta.l15=temp;end;
        if cc==16;meta.l16=temp;end;
        if cc==17;meta.l17=temp;end;
        if cc==18;meta.l18=temp;end;
        if cc==19;meta.l19=temp;end;
        if cc==20;meta.l20=temp;end;
        if cc==21;meta.l21=temp;end;
        if cc==22;meta.l22=temp;end;
        if cc==23;meta.l23=temp;end;
        if cc==24;meta.l24=temp;end;
        if cc==25;meta.l25=temp;end;
        if cc==26;meta.l26=temp;end;
        if cc==27;meta.l27=temp;end;
        if cc==28;meta.l28=temp;end;
        if cc==29;meta.l29=temp;end;
        if cc==30;meta.l30=temp;end;
        if cc==31;meta.l31=temp;end;
        if cc==32;meta.l32=temp;end;
        if cc==33;meta.l33=temp;end;
        if cc==34;meta.l34=temp;end;
        if cc==35;meta.l35=temp;end;
        if cc==36;meta.l36=temp;end;
        if cc==37;meta.l37=temp;end;
        if cc==38;meta.l38=temp;end;
        if cc==39;meta.l39=temp;end;
        if cc==40;meta.l40=temp;end;
        if cc==41;meta.l41=temp;end;
        if cc==42;meta.l42=temp;end;
        if cc==43;meta.l43=temp;end;
        if cc==44;meta.l44=temp;end;
        if cc==45;meta.l45=temp;end;     
        if cc==46;meta.LAT=str2num(temp);end;
        if cc==47;meta.LON=str2num(temp);end;
        clear temp
    end
    fclose('all');
end

end

