with p_esiut; use p_esiut;
with Sequential_io;

procedure creation is

package P_Pos_io is new Sequential_io (positive);
use P_Pos_io;

f: P_Pos_io.file_type;

nb,val: integer;
begin
nb:= 0;
create(f, out_file,"fichkm");
lire(val);

while val /= 0 loop    
write(f,val);
nb:=nb+1;
ecrire("Saisissez une valeur :");
lire(val);

end loop;



close(f);
ecrire("Nombre total de valeurs saisies :");
ecrire(nb);

end creation;