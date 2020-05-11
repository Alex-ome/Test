with p_esiut; use p_esiut;
with Sequential_io;

package p_km is

package P_Pos_io is new Sequential_io (positive);
use P_Pos_io;

type TV_Ent is array(integer range <>) of positive;

procedure Taille(f : in out P_Pos_io.file_type;nbelem : out natural);
--{f ouvert} => {nbelem =nombre d'éléments de f}

procedure Affiche ( f : in out P_Pos_io.file_type);

procedure Tribulle( V: in out TV_Ent);

procedure Sauvegarde( V: in TV_Ent; f : in out P_Pos_io.file_type);

procedure Ligne_Aff(V: in TV_Ent);

end p_km;