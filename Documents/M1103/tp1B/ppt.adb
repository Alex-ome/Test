with p_graphbase; use p_graphbase;
with p_figures; use p_figures;
with p_esiut; use p_esiut;

procedure ppt is

triangle: TV_Triangle;
Contchoix : TR_Contexte;

begin

for i in 1..3 loop
    ecrire("Coordonnée du point ");
    ecrire(i);
    ecrire(":");
    lire(triangle(i).x);
    lire(triangle(i).y);
end loop;


initialisation;
ouvrir_fenetre(400,400);
attendre_clic;
Contchoix.Coul:= blanc;
Contchoix.Asp:= continu;
Contchoix.Epais:= 10;
dessiner(triangle,Contchoix);
attendre_clic;
Contchoix.Coul:= gris;
dessiner(triangle,Contchoix);
attendre_clic;
fermer_fenetre;

end ppt;