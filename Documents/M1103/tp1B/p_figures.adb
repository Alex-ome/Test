with p_graphbase; use p_graphbase;

package body p_figures is

    procedure dessiner(Bris : in TV_LigneBrisee; Cont:in TR_Contexte) is
        
        begin

        for i in Bris'First+1..Bris'Last loop

            tracer_droite(Bris(i-1),Bris(i),(Cont.Coul,Cont.Asp,Cont.Epais));

        end loop;

    end dessiner;


    procedure dessiner(Rect : in TR_Rectangle; Cont: in TR_Contexte) is

        begin
        tracer_droite(Rect.CoinG,Rect.Largeur,(Cont.Coul,Cont.Asp,Cont.Epais));
        tracer_droite(Rect.CoinG,Rect.Hauteur,(Cont.Coul,Cont.Asp,Cont.Epais));
        tracer_droite(Rect.Largeur,(Rect.Largeur.x,Rect.Hauteur.y),(Cont.Coul,Cont.Asp,Cont.Epais));
        tracer_droite(Rect.Hauteur,(Rect.Largeur.x,Rect.Hauteur.y),(Cont.Coul,Cont.Asp,Cont.Epais));


    end dessiner;

    procedure dessiner(Triangle : in TV_Triangle; Cont: in TR_Contexte) is

        begin
        tracer_droite(Triangle(1),Triangle(2),(Cont.Coul,Cont.Asp,Cont.Epais));
        tracer_droite(Triangle(2),Triangle(3),(Cont.Coul,Cont.Asp,Cont.Epais));
        tracer_droite(Triangle(3),Triangle(1),(Cont.Coul,Cont.Asp,Cont.Epais));
        
    end dessiner;

end p_figures;