function meta = get_meta_METEK_winds(fn)

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
        if cc==46;meta.l46=temp;end; 
        if cc==47;meta.l47=temp;end; 
        if cc==48;meta.l48=temp;end; 
        if cc==49;meta.l49=temp;end; 
        if cc==50;meta.l50=temp;end; 
        if cc==51;meta.l51=temp;end; 
        if cc==52;meta.l52=temp;end; 
        if cc==53;meta.l53=temp;end; 
        if cc==54;meta.l54=temp;end;
        if cc==55;meta.l55=temp;end;
        if cc==56;meta.l56=temp;end;
        if cc==57;meta.l57=temp;end;
        if cc==58;meta.l58=temp;end;
        if cc==59;meta.l59=temp;end; 
        if cc==60;meta.l60=temp;end; 
        if cc==61;meta.l61=temp;end; 
        if cc==62;meta.l62=temp;end; 
        if cc==63;meta.l63=temp;end; 
        if cc==64;meta.l64=temp;end; 
        if cc==65;meta.l65=temp;end; 
        if cc==66;meta.l66=temp;end; 
        if cc==67;meta.l67=temp;end; 
        if cc==68;meta.l68=temp;end;
        if cc==69;meta.l69=temp;end;
        if cc==70;meta.l70=temp;end; 
        if cc==71;meta.l71=temp;end; 
        if cc==72;meta.l72=temp;end; 
        if cc==73;meta.l73=temp;end; 
        if cc==74;meta.l74=temp;end;
        if cc==75;meta.l75=temp;end;
        if cc==76;meta.l76=temp;end;
        if cc==77;meta.l77=temp;end;
        if cc==78;meta.l78=temp;end;
        if cc==79;meta.l79=temp;end; 
        if cc==80;meta.l80=temp;end; 
        if cc==81;meta.l81=temp;end; 
        if cc==82;meta.l82=temp;end; 
        if cc==83;meta.l83=temp;end; 
        if cc==84;meta.l84=temp;end; 
        if cc==85;meta.l85=temp;end; 
        if cc==86;meta.l86=temp;end; 
        if cc==87;meta.l87=temp;end; 
        if cc==88;meta.l88=temp;end;
        if cc==89;meta.l89=temp;end;
        
        if cc==90;meta.LAT=str2num(temp);end;
        if cc==91;meta.LON=str2num(temp);end;
        clear temp
    end
    fclose('all');
end

