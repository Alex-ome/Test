with text_io; use text_io;
with p_textbin; use p_textbin;

procedure conversion is
f:text_io.file_type;

begin
open(f,in_file,"/users/info/pub/1a/M1103/tp5B/fclub.txt");

AfficheClubs(f);

end conversion;