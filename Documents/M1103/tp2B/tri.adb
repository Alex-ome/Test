with p_esiut, p_biblio; use p_esiut, p_biblio;

procedure tri is
	Vect : TV_Biblio(1..Taille);
begin
	
	--------------------------------
	-- ne pas modifier
	LireVect(Vect);
	
	TriReplaceAuteurAnnee(Vect);
	AfficherVect (Vect); 
	--------------------------------
end tri;
