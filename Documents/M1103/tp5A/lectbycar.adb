with text_io; use text_io;
with p_esiut; use p_esiut;

procedure lectbycar is

f: text_io.file_type;
car: character;

begin

open(f, in_file, "monfic.txt");

while not end_of_file(f) loop
   while not end_of_line(f) loop
        get(f,car);
        put(car);
    end loop;

    skip_line(f);
    new_line;

   
end loop;




close(f);

end lectbycar;