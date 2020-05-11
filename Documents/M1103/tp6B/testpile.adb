with text_io; use text_io;
with p_pile; use p_pile;
use p_pile.p_reelio;

procedure testpile is

V: TV_Pile(1..4);
quitter: boolean:=false;
c:character;
indtop:natural:=0;
val:float;


begin

loop

put("Voulez vous : Empiler ? (e) Depiler ? (d) Quitter ?");
get(c);

if c='e' then
    get(val);
    empiler(V,indtop,val);
    affichePile(V,indtop);
elsif c='d' then

    depiler(V,indtop,val);
    put("Valeur dépilée :");
    put(val);

else
    quitter:=true;

end if;

exit when quitter;
end loop;

end testpile;