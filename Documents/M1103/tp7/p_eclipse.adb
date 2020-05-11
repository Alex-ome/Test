
package body p_eclipse is

function Avant (d1,d2 : in TR_Date) return boolean is

begin

if d1.Annee < d2.Annee or (d1.Annee = d2.Annee and d1.Mois < d2.Mois) or (d1.Annee = d2.Annee and d1.Mois = d2.Mois and d1.Jour < d2.Jour) then
    return true;
else 
    return false;
end if;

end Avant;



procedure Affiche (E : in TR_Eclipse) is

begin
put("Date :"); put(E.Date.Jour,2); put("/"); put(E.Date.Mois); put("/"); put(E.Date.Annee,4); put("   "); 
put("Catégorie :"); put(E.Categorie); put("   "); 
put("Maximum :"); put(E.HMaxi.Heure,2); put("h"); put(" ");  put(E.HMaxi.Min,2); put("m"); put(" "); put(E.HMaxi.Sec,2); put("s"); put("   ");
put("Magnitude :"); put(E.Magnitude,1,3,0); new_line;

end Affiche;

procedure Affiche (f : in p_eclipse_io.file_type) is
e : TR_Eclipse;
nb: integer:=0;

begin

while not end_of_file(f) loop
    read(f,e);
    Affiche(e);
    nb:=nb+1;
end loop;

put("Nombre d'éclipses :");
put(nb,2);
put_line(" ");

end Affiche;

function TestTri (f :in p_eclipse_io.file_type) return boolean is
pred,succ: TR_Eclipse;
begin
read(f,pred);
read(f,succ);

while Avant(pred.Date,succ.Date) and not end_of_file(f) loop
    pred:=succ;
    read(f,succ);
end loop;
    return Avant(pred.Date,succ.Date);

end TestTri;

procedure Recherche (f :in out p_eclipse_io.file_type; D :in TR_Date) is
m: TR_Eclipse;
begin
reset(f,in_file);
read(f,m);
while Avant(m.Date,D) and not end_of_file(f) loop
    read (f,m);
end loop;

if m.Date=D then
    Affiche(m);
else
    put("La date recherché n'existe pas.");
end if;

end Recherche;

procedure Selection (f, fres: in out p_eclipse_io.file_type; Cat: in T_categorie) is
m : TR_Eclipse;
begin 
reset(f,in_file);
reset(fres,out_file);
while not end_of_file(f) loop
    read(f,m);
    if m.Categorie = Cat then
        write(fres,m);
    end if;
end loop;

end Selection;

procedure Inter(f : in out p_eclipse_io.file_type; g : in out text_io.file_type; D1, D2 : in TR_Date) is

begin
reset(f,in_file);
while not end_of_file(f) loop
 read(f,m);

 if Avant(m.Date,D2) and Avant(D1,m.Date,D2) then
    put();

end loop;
end Inter;


end p_eclipse;