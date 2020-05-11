with p_Esiut; use p_Esiut;

package p_ponderation is

	subtype T_part is integer range 0..500; 	-- pour les participations
	subtype T_note is float range 0.0..20.0;	-- pour les notes
	type TV_part is array(1..5) of T_part;		-- pour les participations d'un groupe de 5
	type TV_note is array(1..5) of T_note;		-- pour les notes d'un groupe de 5

	---------------------------------------------------------------------------------
	procedure Saisie_Part (Vp : out TV_part);	
	-- {} => {V contient les 5 participations saisies pour un groupe} 
	---------------------------------------------------------------------------------
	procedure Calcul_Notes (Vp : in TV_part; Vn : out TV_note; ng : in T_note);
	-- {} => {Vn contient les notes calculées a partir de la note globale ng et des participations de Vp}
	---------------------------------------------------------------------------------

	EX_Mauvais_Total : exception;

end p_ponderation;
