with p_esiut; use p_esiut;
with p_km; use p_km;
use p_km.P_Pos_io;
with Sequential_io;

procedure tri is
c, nb:integer;
f,h :P_Pos_io.file_type;

begin

nb:=0;
open(f,in_file,"/users/info/pub/1a/M1103/tp3/f_distances");
create(h,out_file,"test");
Affiche(f);
reset(f,in_file);
while not end_of_file(f) loop
    read(f,c);
    nb:=nb+1;
end loop;
ecrire_ligne(".");
ecrire("Nombre d'éléments dans p_distance :");
ecrire_ligne(nb);


declare 
    Vect : TV_Ent(1..nb);
    i: integer;

    begin

    i:=1;
    reset(f,in_file);

    while not end_of_file(f) loop
    read(f,c);
    Vect(i):=c;
    i:=i+1;
    end loop;

    Tribulle(Vect);
    Sauvegarde(Vect,h);
    Affiche(h);
    ecrire_ligne(".");
    Ligne_Aff(Vect);
end;

close(f);
close(h);


end tri;