package body p_ponderation is
	---------------------------------------------------------------------------------
	procedure Saisie_Part (Vp : out TV_part) is
	-- {} => {V contient les 5 participations saisies pour un groupe} 
		Nbtotal : integer;
	begin
		
		Nbtotal :=0;
		ecrire_ligne("Saisie des parts");
		for i in Vp'range loop
			ecrire("Part de l'etudiant "&integer'image(i)&" : ");
			lire(Vp(i));
			Nbtotal:= Nbtotal+Vp(i);
		end loop;

		if Nbtotal /= 500 then
			raise EX_Mauvais_Total;
		else
			ecrire_ligne("Le total est bon ! c:");
		end if;


		
	end Saisie_Part;
	---------------------------------------------------------------------------------
	procedure Calcul_Notes (Vp : in TV_part; Vn : out TV_note; ng : in T_note) is
	-- {} => {Vn contient les notes calculées a partir de la note globale ng et des participations de Vp}
	begin
		
		for i in Vp'range loop
			begin
				Vn(i) := float(Vp(i)) * ng / 100.0;
			exception
			when Constraint_Error =>
			Vn(i) :=20.0;

			end;
		end loop;

		

			
		
	end Calcul_Notes;
	---------------------------------------------------------------------------------
end p_ponderation;
