function meta = get_meta_HATPRO_BT(fn)

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
        if cc==90;meta.l90=temp;end;
        if cc==91;meta.l91=temp;end;
        if cc==92;meta.l92=temp;end;
        if cc==93;meta.l93=temp;end;
        if cc==94;meta.l94=temp;end;
        if cc==95;meta.l95=temp;end;
        if cc==96;meta.l96=temp;end;
        if cc==97;meta.l97=temp;end;
        if cc==98;meta.l98=temp;end;
        if cc==99;meta.l99=temp;end;
        if cc==100;meta.l100=temp;end;
        if cc==101;meta.l101=temp;end;
        if cc==102;meta.l102=temp;end;
        if cc==103;meta.l103=temp;end;
        if cc==104;meta.l104=temp;end;
        if cc==105;meta.l105=temp;end; 
        if cc==106;meta.l106=temp;end; 
        if cc==107;meta.l107=temp;end; 
        if cc==108;meta.l108=temp;end; 
        if cc==109;meta.l109=temp;end; 
        if cc==110;meta.l110=temp;end; 
        if cc==111;meta.l111=temp;end; 
        if cc==112;meta.l112=temp;end; 
        if cc==113;meta.l113=temp;end; 
        if cc==114;meta.l114=temp;end;
        if cc==115;meta.l115=temp;end;
        if cc==116;meta.l116=temp;end;
        if cc==117;meta.l117=temp;end;
        if cc==118;meta.l118=temp;end;
        if cc==119;meta.l119=temp;end;
        if cc==120;meta.l120=temp;end;
        if cc==121;meta.l121=temp;end;
        if cc==122;meta.l122=temp;end;
        if cc==123;meta.l123=temp;end;
        if cc==124;meta.l124=temp;end;
        if cc==125;meta.l125=temp;end;
        if cc==126;meta.l126=temp;end;
        if cc==127;meta.l127=temp;end;
        if cc==128;meta.l128=temp;end;
        if cc==129;meta.l129=temp;end;
        if cc==130;meta.l130=temp;end;
        if cc==131;meta.l131=temp;end;
        if cc==132;meta.l132=temp;end;
        if cc==133;meta.l133=temp;end;
        if cc==134;meta.l134=temp;end;
        if cc==135;meta.l135=temp;end;
        if cc==136;meta.l136=temp;end;
        if cc==137;meta.l137=temp;end;
        if cc==138;meta.l138=temp;end;
        if cc==139;meta.l139=temp;end;
        if cc==140;meta.l140=temp;end;
        if cc==141;meta.l141=temp;end;
        if cc==142;meta.l142=temp;end;
        if cc==143;meta.l143=temp;end;
        if cc==144;meta.l144=temp;end;
        if cc==145;meta.l145=temp;end; 
        if cc==146;meta.l146=temp;end; 
        if cc==147;meta.l147=temp;end; 
        if cc==148;meta.l148=temp;end; 
        if cc==149;meta.l149=temp;end; 
        if cc==150;meta.l150=temp;end; 
        if cc==151;meta.l151=temp;end; 
        if cc==152;meta.l152=temp;end; 
        if cc==153;meta.l153=temp;end; 
        if cc==154;meta.l154=temp;end;
        if cc==155;meta.l155=temp;end;
        if cc==156;meta.l156=temp;end;
        if cc==157;meta.l157=temp;end;
        if cc==158;meta.l158=temp;end;
        if cc==159;meta.l159=temp;end; 
        if cc==160;meta.l160=temp;end; 
        if cc==161;meta.l161=temp;end; 
        if cc==162;meta.l162=temp;end; 
        if cc==163;meta.l163=temp;end; 
        if cc==164;meta.l164=temp;end; 
        if cc==165;meta.l165=temp;end; 
        if cc==166;meta.l166=temp;end; 
        if cc==167;meta.l167=temp;end; 
        if cc==168;meta.l168=temp;end;
        if cc==169;meta.l169=temp;end;
        if cc==170;meta.l170=temp;end;
        if cc==171;meta.l171=temp;end;
        if cc==172;meta.l172=temp;end;
        if cc==173;meta.l173=temp;end;
        if cc==174;meta.l174=temp;end;
        if cc==175;meta.l175=temp;end;
        if cc==176;meta.l176=temp;end;
        if cc==177;meta.l177=temp;end;
        if cc==178;meta.l178=temp;end;
        if cc==179;meta.l179=temp;end;
        if cc==180;meta.l180=temp;end;
        if cc==181;meta.l181=temp;end;
        if cc==182;meta.l182=temp;end;
        if cc==183;meta.l183=temp;end;
        if cc==184;meta.l184=temp;end;
        if cc==185;meta.l185=temp;end;
        if cc==186;meta.l186=temp;end;
        if cc==187;meta.l187=temp;end;
        if cc==188;meta.l188=temp;end;
        if cc==189;meta.l189=temp;end;
        if cc==190;meta.l190=temp;end;
        if cc==191;meta.l191=temp;end;
        if cc==192;meta.l192=temp;end;
        if cc==193;meta.l193=temp;end;
        if cc==194;meta.l194=temp;end;
        if cc==195;meta.l195=temp;end;
        if cc==196;meta.l196=temp;end;
        if cc==197;meta.l197=temp;end;
        if cc==198;meta.l198=temp;end;
        if cc==199;meta.l199=temp;end;
        if cc==200;meta.l200=temp;end;
        if cc==201;meta.l201=temp;end;
        if cc==202;meta.l202=temp;end;
        if cc==203;meta.l203=temp;end;
        if cc==204;meta.l204=temp;end;
        if cc==205;meta.l205=temp;end; 
        if cc==206;meta.l206=temp;end; 
        if cc==207;meta.l207=temp;end; 
        if cc==208;meta.l208=temp;end; 
        if cc==209;meta.l209=temp;end; 
        if cc==210;meta.l210=temp;end; 
        if cc==211;meta.l211=temp;end; 
        if cc==212;meta.l212=temp;end; 
        if cc==213;meta.l213=temp;end;
        
        if cc==214;meta.LAT=str2num(temp);end;
        if cc==215;meta.LON=str2num(temp);end;
        clear temp
    end
    fclose('all');
end

