with p_graphbase; use p_graphbase;

procedure exemple is

begin

	initialisation;
	ouvrir_fenetre(400,400);
	attendre_clic;
	tracer_droite((50,200),(350,200),(noir,continu,5));
	attendre_clic;
	fermer_fenetre;

end exemple;
