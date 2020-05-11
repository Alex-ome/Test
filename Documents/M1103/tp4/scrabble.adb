with p_esiut; use p_esiut;
with p_scrabble; use p_scrabble;
use p_scrabble.p_mot_io;
with sequential_io;

procedure scrabble is
f,g: p_mot_io.file_type;
m, n,c: T_mot;
Jeu : string:= MelangeJetons;
tirage: string:="RINTES@";

begin

open(f,in_file,"/users/info/pub/1a/M1103/tp4/scrabbles.bin");

--create(g, out_file,"Mot_W");

--read(f,m);
--read(f,n);



--Affiche(m);
--ecrire_ligne("");
--Affiche(n);

--ecrire_ligne(Squelette(m));
--ecrire_ligne(NBPoints(m));
--ecrire_ligne(Squelette(n));
--ecrire_ligne(NBPoints(n));
--ecrire_ligne(MaxPoints(f));
--MotsGagnants(f);



--while not end_of_file(f) loop
    --read(f,c);
    --if Anagramme("RIANTES",c) then
       -- ecrire_ligne(c);
   -- end if;
--end loop;



--if Existe(f,"WESTERN") then
    --ecrire_ligne("WESTERN existe faut croire.");
--else
    --ecrire_ligne("Non, WESTERN n'existe pas.");
--end if;



--CreeFicMots (f,'W',g);

--reset(g,in_file);

--while not end_of_file(g) loop
    --read(g,c);
    --ecrire_ligne(c);
--end loop;





--close(g);



ecrire(Mapping(tirage,"RIANTES"));











close(f);

end scrabble;