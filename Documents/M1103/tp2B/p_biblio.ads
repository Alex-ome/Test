with p_esiut; use p_esiut;

package p_biblio is

	------------------------------------------------------------------------------------------
	-- NE PAS MODIFIER !!!
	------------------------------------------------------------------------------------------

	subtype String20 is string(1..20);
	subtype String100 is string(1..100);


	type TR_Biblio is
	  record 
		 Auteur : String20;   -- Auteur de l'oeuvre
		 Annee : integer;     -- Annee de publication
		 Titre : String100;   -- Titre de l'oeuvre
	end record;

	function Taille return natural;
	-- donne la taille du vecteur

	Type TV_Biblio is array (integer range <>) of TR_Biblio;

	procedure Lirevect(Vect : out TV_Biblio);
	--{} => {le vecteur Vect est initialisé à partir du fichier "les_biblio"

	procedure Afficherbiblio(Ref : in TR_Biblio) ;
	-- {} => {Affiche l'auteur, l'annee de publication et le titre de Ref}

	procedure AfficherVect(Vect : in TV_Biblio) ;
	-- {} => {Affiche toutes les références bibliographiques du vecteur Vect}

	------------------------------------------------------------------------------------------
	-- A COMPLETER 
	------------------------------------------------------------------------------------------
	procedure TriBulleTitre(Vect : in out TV_Biblio) ;
	--{} =>{Vect trié sur les titres selon la méthode du tri bulle optimisé}

	procedure Permut(a,b : in out TR_Biblio);

	function SupStrict(Bib1, Bib2: in TR_Biblio) return boolean;
	--{résultat = vrai si Bib1 > Bib2 selon l’ordre (auteur, année)}

	function PositSup(W: in TV_Biblio; Bib : in TR_Biblio) return positive;
	--{Wnon vide, trié selon l’ordre (auteur, année), Bib < W(W'last)} --=> {résultat = indicedu premier élément de Wstrictement supérieurà Bib selon l’ordre (auteur, année)}
	
	procedure TriReplaceAuteurAnnee (Vect : in out TV_Biblio) ;
	--{} =>{Vect est trié selon l’ordre (auteur, année) par application de la méthode du tri par "insertion"}

	procedure RechRomans(Vect: in TV_Biblio; Auteur: in String20);
	--{Vect trié selon l’ordre (auteur, année)}--=> {si Auteur existe dans Vect, le nombre et les titres de ses romans sont affichés}
	-----------------------------------------------------------------------------------------

end p_biblio;
