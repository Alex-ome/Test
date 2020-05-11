with text_io; use text_io;
with p_esiut; use p_esiut;

procedure lectent is

package P_intio is new integer_io(integer); use P_intio;

f: text_io.file_type;

n : integer;

begin
open(f, in_file,"entiers.txt");
while not end_of_file(f) loop
    while not end_of_line(f) loop
        get(f,n);
        put(n);
        new_line;

    end loop;
    skip_line(f);
    
end loop;




close(f);

put(integer'first);

end lectent;