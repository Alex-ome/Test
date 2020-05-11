with P_Esiut; use P_Esiut;

procedure saisie_vecteur is

	subtype T_Chiffre is Integer range 0..9;
	type TV_Chiffre is array(1..5) of T_Chiffre;
	V : TV_chiffre;

begin
	loop
		begin
	
			for i in V'range loop
				Ecrire("Entrez l'element numero ");
				Ecrire(i); Ecrire(" : ");
				Lire(V(i));
				
			end loop;
			
			exit;

			exception
				when Constraint_Error =>
					ecrire_ligne("Entrez un numéro entre 0 et 9.");
		end;
	end loop;

				
	ecrire_ligne("Le vecteur saisi est :");
			
	for i in V'range loop 
				ecrire(V(i)); 
	end loop;

			
		
		

		
end saisie_vecteur;
