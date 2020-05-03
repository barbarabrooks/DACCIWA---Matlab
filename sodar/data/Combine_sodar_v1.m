function Combine_sodar_v1(dn, do, YY, MM1, MM2, DD1, DD2)

list=dir(dn);
for m=MM1:MM2
    if m>9
        f1=num2str(m);
    else
        f1=['0',num2str(m)];
    end
    for d=DD1:DD2
       if d>9
           f2=num2str(d);
       else
           f2=['0',num2str(d)];
       end
       f=[num2str(YY),f1,f2];
       %find the number of files for this day
       fp=[];cc=0;
       for n=3:length(list)
           ix=strfind(list(n).name,f);
           if ~isempty(ix)
               cc=cc+1;
               fp(cc)=n;
           end
       end
       if length(fp)==1
           load(fullfile(dn,list(fp(1)).name));
           save(fullfile(do,list(fp(1)).name),'data','-v7.3');
           clear data
       end
       if length(fp)>1
           for n=1:length(fp)
               load(fullfile(dn,list(fp(n)).name));
               if n==1
                   data1=data;
               else
                   data1.DT=[data1.DT;data.DT];
                   data1.DoY=[data1.DoY;data.DoY];
                   data1.ST=[data1.ST;data.ST];
                   data1.ET=[data1.ET;data.ET];
                   data1.Z=[data1.Z;data.Z];
                   data1.WS=[data1.WS;data.WS];
                   data1.WD=[data1.WD;data.WD];
                   data1.U=[data1.U;data.U];
                   data1.V=[data1.V;data.V];
                   data1.W=[data1.W;data.W];
                   data1.SH=[data1.SH;data.SH];
                   data1.sigU=[data1.sigU;data.sigU];
                   data1.sigV=[data1.sigV;data.sigV];
                   data1.sigW=[data1.sigW;data.sigW];
                   data1.sigD=[data1.sigD;data.sigD];
                   data1.errU=[data1.errU;data.errU];
                   data1.errV=[data1.errV;data.errV];
                   data1.errW=[data1.errW;data.errW];
                   data1.B=[data1.B;data.B];
                   data1.B_bck=[data1.B_bck;data.B_bck];
                   data1.B_avg=[data1.B_avg;data.B_avg];
                   data1.err_code=[data1.err_code;data.err_code];
                   data1.flag.winds=[data1.flag.winds;data.flag.winds];
                   data1.flag.components.U=[data1.flag.components.U;data.flag.components.U];
                   data1.flag.components.V=[data1.flag.components.V;data.flag.components.V];
                   data1.flag.components.W=[data1.flag.components.W;data.flag.components.W];
                   data1.flag.backscatter=[data1.flag.backscatter;data.flag.backscatter];
                   data1.flag.background_noise=[data1.flag.background_noise;data.flag.background_noise];
               end
               clear data
           end
           data=data1; clear data1
           save(fullfile(do,list(fp(1)).name),'data','-v7.3');
           clear data
       end
    end
end

    