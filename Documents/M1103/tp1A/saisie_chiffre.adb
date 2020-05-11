with P_Esiut; use P_Esiut;

procedure saisie_chiffre is

	subtype T_Chiffre is Integer range 0..9;
	Val : T_Chiffre;

begin
	loop
		begin
			Ecrire("Entrez un chiffre : ");
			Lire(Val);
			Ecrire("Le chiffre saisi est : "); Ecrire_Ligne(Val);
			exit;
			exception
				when Constraint_Error =>
				Ecrire_Ligne("Entrez un chiffre entre 0 et 9");
		end;
	end loop;
			
end saisie_chiffre;

