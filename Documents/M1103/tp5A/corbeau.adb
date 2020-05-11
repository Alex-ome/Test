with text_io; use text_io;
with p_esiut; use p_esiut;

procedure corbeau is
f: text_io.file_type;
nblig, nbpag: integer;
car: character;
begin
nblig:=0;
nbpag:=0;

open(f, in_file,"corbeau.txt");

while not end_of_file(f) loop

    put(image(end_of_page(f)));
        
        
    while not end_of_line(f) loop
        get(f,car);
        put(car);
        if end_of_page(f)  then
            nbpag:=nbpag+1;
        end if;
        
    end loop;

        nblig:=nblig+1;

     
     skip_line(f);
     new_line;
     put(image(nblig));
     put(image(nbpag));
        
end loop;
close(f);

end corbeau;