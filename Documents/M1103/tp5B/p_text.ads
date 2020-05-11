
with text_io; use text_io;

package p_text is

package P_intio is new integer_io(integer); use P_intio;

subtype T_Minuscule is character(a..z);
type TV_Nbocc is array(<> T_Minuscule) of natural;

function NbLignes(f : in text_io.file_type) return natural;
--{f ouverten lecture, f-= <>} => {résultat =nombre de lignes de f}

procedure AfficheParLigne(f : in out text_io.file_type) ;
--{f ouvert, chaque ligne comporte moins de 100 caractères} --=> {chaque ligne de f est affichée, précédée de son numéro de ligne}

function NbCar(f: in text_io.file_type) return natural;
--{f ouvert en lecture, f-= <>}=> {résultat =nombre de caractères de f}

procedure NbOccurrences(f: in out text_io.file_type; V: out TV_NbOcc);
--{f ouvert} => {pour chaque indice car, V(car)= nombre de car dans f}


end p_text;