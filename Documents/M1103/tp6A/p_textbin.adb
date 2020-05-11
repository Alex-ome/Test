with text_io; use text_io;

package body p_textbin is

package p_intio is new integer_io(integer); use p_intio;

procedure AfficheClubs(f : in out text_io.file_type)is
i:integer:=1;
fin:natural;
s:string(1..50);

begin

reset(f,in_file);
    for j in 1..3 loop
        skip_line(f);
    end loop;
    
    while not end_of_file(f) loop
       
        new_line;
        put("Club n°");
        put(integer'image(i));
        new_line;
        i:=i+1;
        
            for k in 1..4 loop
                
                get_line(f,s,fin);
                put_line(s(1..fin));
                
            end loop;

            if not end_of_file(f) then
            skip_line(f); put("");
            end if;
        
        

    end loop;



end AfficheClubs;

end p_textbin;