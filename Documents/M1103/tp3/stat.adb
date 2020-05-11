with p_esiut; use p_esiut;
with p_km;use p_km;
use p_km.P_Pos_io;

procedure stat is
nb: natural;
f: P_Pos_io.file_type;
mini,maxim : positive;
lol: float;
procedure Maximum(f : in out p_pos_io.file_type; max : out positive) is
	--{f ouvert en lecture} => {max = maximum des éléments de f}
		val : positive;
        
	begin
		reset(f,in_file);
		read(f, max);
		while not end_of_file(f) loop
			read(f, val);
			if val > max then
				max := val;
			end if;
		end loop;
	exception
		when others => 
			Ecrire_ligne("Procédure Maximum : Erreur fatale...");
			raise;
	end Maximum;

    procedure Minimum(f : in out p_pos_io.file_type; min : out positive) is
	--{f ouvert en lecture} => {min = minimum des éléments de f}
		val : positive;
	begin
		reset(f,in_file);
		min := positive'last;
		while not end_of_file(f) loop
			read(f, val);
			if val < min then
				min := val;
			end if;
		end loop;
		
	exception
		when others => 
			Ecrire_ligne("Procédure Minimum : Erreur fatale...");
			raise; 
	end Minimum;

    procedure Moyenne(f : in out p_pos_io.file_type; moy : out float) is
	--{f ouvert en lecture} => {moy = moyenne des éléments de f}
		val : positive := 1;
		n, somme : integer; 
	begin
		reset(f,in_file);
		n := 0; somme := 0;
		while not end_of_file(f) loop
			read(f, val);
			n := n + 1;
			somme := somme + val;
		end loop;
		moy := float(somme) / float(n);
	exception
		when others => 
			Ecrire_ligne("Procédure Moyenne : Erreur fatale...");
			raise;		
	end Moyenne;

begin

open(f, in_file,"fichkm");
Taille(f,nb);
Maximum(f,maxim);
Minimum(f,mini);
Moyenne(f,lol);
close(f);
ecrire(nb);



exception
    when NAME_ERROR => ecrire("Le fichier n'a pas été trouvé !");
    when STATUS_ERROR => ecrire("Soit le fichier est déjà fermé, soit le fichier n'a pas encore été ouvert ou soit le nom du fichier est déjà associé à un autre fichier !");
    when MODE_ERROR => ecrire("Mauvais mode !");
    when END_ERROR => ecrire("On est à la fin du fichier !");

end stat;