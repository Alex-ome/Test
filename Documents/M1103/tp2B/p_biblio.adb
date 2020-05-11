with direct_io; -- ne pas supprimer cette ligne !!!

package body p_biblio is

	------------------------------------------------------------------------------------------
	-- NE PAS MODIFIER !!!
	------------------------------------------------------------------------------------------
	package p_biblio_io is new direct_io(TR_Biblio); use p_biblio_io;

	f : file_type;

	function Taille return natural is
		Taille_fich : natural;
	begin
		open(f, in_file,"les_biblio");
		taille_fich := natural(size(f));
		close(f);
		return Taille_fich;
	end Taille;

	procedure Lirevect(Vect : out TV_Biblio) is
	--{} => {le vecteur Vect est initialisé à partir du fichier "les_biblio"
	begin
	  open(f, in_file,"les_biblio");
	  for J in Vect'range loop
		  read(f,Vect(J));
	  end loop;
	  close(f);
	end Lirevect;

	------------------------------------------------------------------------------------------
	procedure Afficherbiblio(Ref : in TR_Biblio) is
	-- {} => {Affiche l'auteur, l'annee de publication et le titre de Ref}
	begin
		Ecrire(Ref.Auteur);
		Ecrire(Ref.Annee);
		Ecrire_ligne("  " & Ref.Titre);
	end Afficherbiblio;

	------------------------------------------------------------------------------------------
	procedure AfficherVect(Vect : in TV_Biblio) is
	-- {} => {Affiche toutes les bibliographies du vecteur Vect}
	begin
		ecrire_ligne("------------------------------------------------------------------");
		Ecrire_Ligne("Auteur              Annee  Titre" );
		A_La_Ligne;
		for i in Vect'Range loop 
			Afficherbiblio (Vect(i));
		end loop;
		ecrire_ligne("------------------------------------------------------------------");
	end AfficherVect;
	------------------------------------------------------------------------------------------
	-- A COMPLETER 
	------------------------------------------------------------------------------------------

	procedure Permut(a,b : in out TR_Biblio) is
	c: TR_Biblio;
	begin
	c:=b;
	b:=a;
	a:=c;
	end Permut;


	procedure TriBulleTitre(Vect : in out TV_Biblio) is
	--{} =>{Vect trié sur les titres selon la méthode du tri bulle optimisé}
	i: integer:= Vect'first;
	begin

	while i < Vect'last loop
		for j in reverse i+1..Vect'last loop
			if Vect(j).Titre < Vect(j-1).Titre then
				Permut(Vect(j),Vect(j-1));
			end if;
		end loop;
		i:=i+1;
	end loop;

	end TriBulleTitre;

	function SupStrict(Bib1, Bib2: in TR_Biblio) return boolean is
	--{résultat = vrai si Bib1 > Bib2 selon l’ordre (auteur, année)}
	begin
		if (Bib1.Auteur > Bib2.Auteur) or (Bib1.Auteur = Bib2.Auteur and Bib1.Annee > Bib2.Annee) then
			return true;
		else 
			return false;
		end if;

	end SupStrict;


	function PositSup(W: in TV_Biblio; Bib : in TR_Biblio) return positive is
	--{Wnon vide, trié selon l’ordre (auteur, année), Bib < W(W'last)} --=> {résultat = indicedu premier élément de Wstrictement supérieurà Bib selon l’ordre (auteur, année)}
	j: integer:=W'first;
	begin
	while SupStrict(Bib,W(j)) loop
		j:=j+1;
	end loop;
	return j;
	
	end PositSup;


	procedure TriReplaceAuteurAnnee (Vect : in out TV_Biblio) is
	--{} =>{Vect est trié selon l’ordre (auteur, année) par application de la méthode du tri par "insertion"}
	sauv: TR_Biblio;
	i, k:integer;
	begin
	i:=Vect'first+1;
	while i < Vect'last+1 loop
		if SupStrict(Vect(i-1),Vect(i)) then
			k:= PositSup(Vect(Vect'first..i-1), Vect(i));
			sauv:=Vect(i);
			Vect(k+1..i) := Vect(k..i-1);
			Vect(k):=sauv;
		end if;
		i:= i+1;
	end loop;


	end TriReplaceAuteurAnnee;

	procedure RechRomans(Vect: in TV_Biblio; Auteur: in String20) is
	begin
	for i in Vect'Range loop

		if Vect(i).Auteur = Auteur then
			Ecrire("");

	end RechRomans;
	------------------------------------------------------------------------------------------

end p_biblio;
