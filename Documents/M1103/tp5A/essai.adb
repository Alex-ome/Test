with text_io; use text_io;
with p_esiut; use p_esiut;

procedure essai is
f: text_io.file_type;
s: string(1..10);
nbcar: integer;
begin

open(f, in_file,"essai.txt");

    while not end_of_file(f) loop
        get_line(f,s,nbcar);
        put(s(1..nbcar));
        if nbcar < s'length then
            new_line;
        end if;
    end loop;

           
        


       
        



close(f);

end essai;