with p_ponderation; use p_ponderation;
with P_Esiut; use P_Esiut;

procedure notation is

	Vpart : TV_part;
	Vnote : TV_note;
	Note_groupe : float;
	
begin

	loop
		ecrire("Note du groupe : "); lire(Note_groupe);
		if Note_groupe not in 0.0..20.0 then		
			ecrire_ligne("Une note ne doit pas être négative et ne peut pas dépasser 20, recommencez...");
		end if;
		exit when Note_groupe in 0.0..20.0;
	end loop;

	Saisie_Part (Vpart);

	Calcul_Notes(Vpart, Vnote, Note_groupe);
	
	ecrire_ligne("Affichage des notes finales");
	for i in Vnote'range loop 
		ecrire_ligne(Vnote(i)); 
	end loop;

	exception
		when Constraint_Error =>
			ecrire_ligne("Il y a une erreur au niveau des fonctions.");
		when EX_Mauvais_Total =>
			ecrire_ligne("Le total ne vaut pas 500 ! :c");

end notation;
		
			
