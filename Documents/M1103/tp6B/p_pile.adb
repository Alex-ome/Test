
with text_io; use text_io;
package body p_pile is



function pilevide(P : in TV_Pile ; indtop : in natural) return boolean is

begin

if indtop < P'first then
   return true;
else
    return false;
end if;


end pilevide;



function pilepleine(P : in TV_Pile ; indtop : in natural) return boolean is

begin

if indtop = P'last then
    return true;
else
    return false;
end if;

end pilepleine;



procedure empiler(P : in out TV_pile; indtop : in out natural; val : in float) is

begin

if pilepleine(P,indtop) then
    raise EX_PILE_PLEINE;
else
    P(indtop):=val;
    indtop:=indtop+1;
end if;

end empiler;


procedure depiler(P : in out TV_pile; indtop : in out natural; val : out float) is

begin

if pilevide(P,indtop) then
    raise EX_PILE_VIDE;
else
    val:=P(indtop);
    indtop:=indtop-1;
end if;

end depiler;


procedure affichePile (P: in TV_Pile; indtop : in natural) is
begin

for i in P'first..indtop loop
    put(P(i));
    put(" ");
end loop;

end affichePile;

end p_pile;