with p_graphbase; use p_graphbase;

package p_figures is

   type TV_LigneBrisee is array (integer range <>) of TR_Point;
   type TV_Triangle is new TV_lignebrisee(1..3);
   type TR_Rectangle is record
      CoinG : TR_Point;
      Largeur : TR_Point;
      Hauteur : TR_Point;
   end record;

   procedure dessiner(Bris : in TV_LigneBrisee; Cont:in TR_Contexte);

   procedure dessiner(Rect : in TR_Rectangle; Cont: in TR_Contexte);

   procedure dessiner(Triangle : in TV_Triangle; Cont: in TR_Contexte);
    

end p_figures;