with text_io; use text_io;
package p_pile is

package p_reelio is new float_io(float); use p_reelio;

type TV_Pile is array (positive range <>) of float;

EX_PILE_VIDE, EX_PILE_PLEINE: exception;


function pilevide(P : in TV_Pile ; indtop : in natural) return boolean ;
--{} => {résultat = vrai si la pile est vide}
function pilepleine(P : in TV_Pile ; indtop : in natural) return boolean ;
--{} => {résultat = vrai si la pile est pleine}
procedure empiler(P : in out TV_pile; indtop : in out natural; val : in float) ;
--{} => {si la pile est pleine, l'erreur EX_PILE_PLEINE est déclenchée, --sinon val a été empilée et indtopest l'indice du sommet de la pile}
procedure depiler(P : in out TV_pile; indtop : in out natural; val : out float) ;
--{} => {si la pile est vide, l'erreur EX_PILE_VIDE est déclenchée, sinon lesommet--de la pile a étéretiré, val contient sa valeur,indtop est l'indice du--sommet de la pile}
procedure affichePile (P: in TV_Pile; indtop : in natural) ;
--{} => {affiche le contenu de la pile}

end p_pile;