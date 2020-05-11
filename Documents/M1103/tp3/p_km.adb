with p_esiut; use p_esiut;
with Sequential_io;

package body p_km is


procedure Taille(f : in out P_Pos_io.file_type;nbelem : out natural) is

val:integer;

begin

reset(f,in_file);
nbelem:=0;

while not end_of_file(f) loop
read(f,val);
nbelem:=nbelem+1;
end loop;

end Taille;

procedure Affiche ( f : in out P_Pos_io.file_type) is

    c:integer;

    begin

    reset(f, in_file);

    while not end_of_file(f) loop
    read(f,c);
    ecrire(c);
    end loop;

end Affiche;

procedure Tribulle( V: in out TV_Ent) is
    permute:positive;
begin

    for i in V'first..V'last loop
        for j in reverse i+1..V'last loop
            if V(j)<V(j-1) then
                permute:=V(j);
                V(j):=V(j-1);
                V(j-1):=permute;
            end if;

        end loop;

    end loop;


end Tribulle;

procedure Sauvegarde( V: in TV_Ent; f : in out P_Pos_io.file_type) is

begin
reset(f,out_file);
for i in V'range loop
    write(f,V(i));
end loop;


end Sauvegarde;

procedure Ligne_Aff(V: in TV_Ent) is
nbbis,p,d: integer;
begin
nbbis:=0;
p:=0;
d:=9;
 ecrire("KM entre");
    ecrire(p);
    ecrire(" et ");
    ecrire(d);
    ecrire(":");
for i in V'range loop
    

 if V(i) > d then
    ecrire_ligne(" ");
    p:=p+10;
    d:=d+10; 
    ecrire("KM entre");
    ecrire(p);
    ecrire(" et ");
    ecrire(d);
    ecrire(":");
end if;
    ecrire(V(i));
    nbbis:=nbbis+1;
end loop;


end Ligne_Aff;


end p_km;