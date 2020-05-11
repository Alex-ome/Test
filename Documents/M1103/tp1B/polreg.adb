with p_graphbase; use p_graphbase;
with p_figures; use p_figures;
with p_esiut; use p_esiut;
with Ada.numerics; use Ada.numerics;
with Ada.numerics.aux; use Ada.numerics.aux;

procedure polreg is

n:double;
Contchoix : TR_Contexte;
begin

ecrire("Donner le nombre de sommet du polygone souhaité :");
lire(integer(n));

declare
    Test: TV_LigneBrisee(1..integer(n));
    begin


    Contchoix.Coul:= blanc;
    Contchoix.Asp:= continu;
    Contchoix.Epais:= 2;

    initialisation;
	ouvrir_fenetre(400,400);
    attendre_clic;
    for i in Test'Range loop
        Test(i).x:=integer(double(200) + double(100)*Cos((double(2)*Pi*double(i))/n));
        Test(i).y:=integer(double(200) - double(100)*Sin((double(2)*Pi*double(i))/n));
        
    end loop;

    for i in Test'first+1..Test'last loop
        tracer_droite(Test(i-1),Test(i),(Contchoix.Coul,Contchoix.Asp,Contchoix.Epais));
    end loop;
        tracer_droite(Test(Test'first),Test(Test'last),(Contchoix.Coul,Contchoix.Asp,Contchoix.Epais));

    attendre_clic;
    fermer_fenetre;

end;

    


end polreg;