with text_io; use text_io;
with p_esiut; use p_esiut;

procedure creefictxt is

f: text_io.file_type;
s: string(1..50);

begin

create(f, out_file,"monfic.txt");

for i in 1..5 loop
    lire(s);
    put_line(f,s);
end loop;


close(f);

end creefictxt;