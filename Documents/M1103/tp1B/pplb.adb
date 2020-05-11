with p_graphbase; use p_graphbase;
with p_figures; use p_figures;
with p_esiut; use p_esiut;

procedure pplb is
    Contchoix : TR_Contexte;
    Lignebris : TV_LigneBrisee(1..5);


    begin
    Lignebris:=((98,80),(65,105),(130,320),(200,54),(100,100));
    
    initialisation;
	ouvrir_fenetre(400,400);
    attendre_clic;
    Contchoix.Coul:= blanc;
    Contchoix.Asp:= continu;
    Contchoix.Epais:= 10;
    dessiner(Lignebris, Contchoix);
    attendre_clic;
    Contchoix.Coul:= gris;
    dessiner(Lignebris, Contchoix);
    attendre_clic;
    fermer_fenetre;


end pplb;