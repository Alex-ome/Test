with text_io; use text_io;

package body p_text is


function NbLignes(f : in text_io.file_type) return natural is
--{f ouverten lecture, f-= <>} => {résultat =nombre de lignes de f}
    nblig: natural;
begin 

    nblig:=0;

    while not end_of_file(f) loop
        skip_line(f);
        nblig:=nblig+1;
    end loop;

    return nblig;


end NbLignes;




procedure AfficheParLigne(f : in out text_io.file_type) is
--{f ouvert, chaque ligne comporte moins de 100 caractères} --=> {chaque ligne de f est affichée, précédée de son numéro de ligne}
    s: string(1..100);
    fin,num: natural;
  
begin
    reset(f,in_file);

    num:=1;


    while not end_of_file(f) loop
    
        get_line(f,s,fin);
        put(num);
        put(" ");
        put(s(1..fin));
        num:=num+1;

        if num mod 25 =0 then
            skip_line;
        end if;

        if fin < s'length then
            new_line;
        end if;

    end loop;

end AfficheParLigne;

end p_text;