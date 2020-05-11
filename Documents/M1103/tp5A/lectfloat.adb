with text_io; use text_io;
with p_esiut; use p_esiut;

procedure lectfloat is

package P_reel is new float_io(float); use P_reel;

f: text_io.file_type;

n : float;

begin


open(f, in_file,"reels.txt");
while not end_of_file(f) loop
    while not end_of_line(f) loop
        get(f,n);
        put(n,7,2,0);
        new_line;

    end loop;

    skip_line(f);
end loop;
close(f);

end lectfloat;