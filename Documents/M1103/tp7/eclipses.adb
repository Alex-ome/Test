with p_eclipse; use p_eclipse; use p_eclipse.p_eclipse_io; use p_eclipse.p_int_io; use p_eclipse.p_mois_io;
with text_io; use text_io;


procedure eclipses is

date1: TR_Date:=(Annee=> 2000,Mois => Mars, Jour=> 6 );
date2: TR_Date:=(Annee=> 1999,Mois => Mars, Jour=> 6 );
date3: TR_Date;
date4: TR_Date:=(Annee=> 2018,Mois => Aout, Jour=> 11 );
f,fres : p_eclipse_io.file_type;
HorraireAj: TR_Horaire:=(Heure=> 10,Min=> 43, Sec=> 7);
DateAj: TR_Date:=(Annee=> 2021,Mois => Juin, Jour=> 10 );
EclipseAj : TR_Eclipse:=(Date=> DateAj,Categorie=> Annulaire,HMaxi=> HorraireAj, Magnitude=> 0.943 );
begin

if Avant(date2,date1) then
    put("Date 2 précède Date 1.");
else 
    put("Date 2 = Date 1 ou vient avant Date 1.");
end if;

open(f,in_file,"feclipses.bin");
Affiche(f);
--reset(f, append_file);
--write(f,EclipseAj);
--reset(f,in_file);
--Affiche(f);
reset(f,in_file);
if TestTri(f)=true then
    put_line("Le fichier est trié !");
    put_line(" ");
else
    put_line("Le fichier n'est pas trié !");
    put_line(" ");
end if;

--put("Année ? :"); get(date3.Annee); put_line(" ");
--put("Mois ? :"); get(date3.Mois); put_line(" ");
--put("Jour ? :"); get(date3.Jour); put_line(" ");

--Recherche(f,date3);

create(fres,out_file,"fTOTALE.bin");
Selection (f,fres,TOTALE);
reset(fres,in_file);
Affiche(fres);
close(fres);

close(f);


end eclipses;