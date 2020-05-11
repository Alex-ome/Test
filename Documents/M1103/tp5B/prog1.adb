with p_text; use p_text;
with text_io; use text_io;
use p_text.P_intio;

procedure prog1 is

    f: text_io.file_type;
    chemin:constant string:="/users/info/pub/1a/M1103/tp5B/";
    choix:string(1..5);
    fin:natural;

    begin
    put("Choisissez entre les fichiers: avare , horla , tlun , cd , fclub : ");
    get_line(choix,fin);

    open(f,in_file,chemin & choix & ".txt");

    put_line("Nb de lignes :");
    put(NbLignes(f));

    skip_line;

    AfficheParLigne(f);


    close(f);

    exception

        when NAME_ERROR => put_line("Erreur sur le nom du fichier."); 
        
        when END_ERROR => put_line("Erreur, il y a lecture après le fichier."); 
        

end prog1;