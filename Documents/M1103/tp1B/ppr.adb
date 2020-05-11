with p_graphbase; use p_graphbase;
with p_figures; use p_figures;
with p_esiut; use p_esiut;

procedure ppr is

Rectangle : TR_Rectangle;
Contchoix : TR_Contexte;

begin


Rectangle.CoinG:=(0,0);
Rectangle.Largeur:=(Rectangle.CoinG.x+200,Rectangle.CoinG.y);
Rectangle.Hauteur:=(Rectangle.CoinG.x,Rectangle.CoinG.y+100);

initialisation;
ouvrir_fenetre(400,400);
attendre_clic;
Contchoix.Coul:= blanc;
Contchoix.Asp:= continu;
Contchoix.Epais:= 10;
dessiner(Rectangle,Contchoix);
attendre_clic;
Contchoix.Coul:= gris;
dessiner(Rectangle,Contchoix);
delay 2.0;
Rectangle.CoinG:=(100,0);
Rectangle.Largeur:=(Rectangle.CoinG.x+200,Rectangle.CoinG.y);
Rectangle.Hauteur:=(Rectangle.CoinG.x,Rectangle.CoinG.y+100);
Contchoix.Coul:= blanc;
dessiner(Rectangle,Contchoix);
attendre_clic;
fermer_fenetre;

end ppr;