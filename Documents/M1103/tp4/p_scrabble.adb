with Ada.Numerics.Discrete_Random; -- ne pas modifier !
with sequential_io;

package body p_scrabble is
	----------------------------------------------------------------------------------------------
	-- PARTIE A NE PAS MODIFIER
	----------------------------------------------------------------------------------------------
	-- déclarations nécessaires pour le tirage aléatoire
	subtype T_numjeton is positive range 1..102;
	
	Package Alea is new Ada.Numerics.Discrete_Random(T_numjeton); use Alea;	
	---------------------------------------------------------
	-- fonction de tirage aléatoire										
	function hasard102 return positive is
	--{} => {résulat = entier tiré au hasard entre 1 et 102}
		Gen : Alea.Generator;
	begin
		 reset(Gen);
		 return Alea.random(Gen);
	end Hasard102;
	---------------------------------------------------------
	function MelangeJetons return string is
	--{} => {résultat = chaîne représentant les 102 jetons du srabble français rangés aléatoirement}

		-- chaîne initiale triée représentant les 102 jetons --------------------------
		VJeu : string(1..102):= 
			(	1..2 => '@',-- caractère JOKER
				3..11 =>'A', 12..13 =>'B', 14..15 =>'C', 16..18 =>'D', 19..33 =>'E',
				34..35 =>'F', 36..37 =>'G', 38..39 =>'H', 40..47 =>'I', 48 =>'J',
				49 =>'K', 50..54 =>'L', 55..57 =>'M', 58..63 =>'N', 64..69 =>'O',
				70..71 =>'P', 72 =>'Q', 73..78 =>'R', 79..84 =>'S', 85..90 =>'T',
				91..96 =>'U', 97..98 =>'V', 99 =>'W', 100 =>'X', 101 =>'Y', 102 =>'Z'  );	 			-------------------------------------------------------------------------------
      Num,i : Integer;
      Jeu : string(1..102);
      VNum : array(VJeu'range) of boolean := (others => true);     
   begin
   	i := Jeu'first;
      while i in Jeu'range loop   
         Num :=Hasard102;
         if VNum(Num) then
            Jeu(i) := VJeu(Num);
            VNum(Num):= false;
            i:=i+1;
         end if;
      end loop;
      return Jeu;	
	end MelangeJetons;
	----------------------------------------------------------------------------------------------
	procedure TirageSansRemise(Jeu : in out string; tirage : out string) is
	--{le caractère '.' représente un jeton de Jeu précédemment tiré} 
	--	=> {tirage est constitué de caractères choisis aléatoirement parmi les jetons disponibles de Jeu
	--		 Jeu est mis à jour (chaque jeton tiré est représenté par un espace}		
		Num : integer;
		reste : natural := Jeu'length;
	begin
		tirage := (others =>' ');
		for i in Jeu'range loop
			if Jeu(i) = ' ' then
				reste := reste-1;
			end if;
		end loop;
		if reste < tirage'length then 
			ecrire_ligne("Plus assez de jetons pour un tirage de" & image(tirage'length) & " jetons !!!");
		else
			for i in tirage'range loop
				loop
					Num := Hasard102;
					exit when Jeu(Num) /= '.';
				end loop;
				tirage(i) := Jeu(Num);
				Jeu(num) := '.';
			end loop;
		end if;
	end TirageSansRemise;
	----------------------------------------------------------------------------------------------			----------------------------------------------------------------------------------------------
	-- PARTIE A COMPLETER
	----------------------------------------------------------------------------------------------
	-- 1 : INTRODUCTION
	----------------------------------------------------------------------------------------------

	procedure Affiche(mot: in T_mot) is
	--{} => {les lettres de motsont affichées sur une ligne, séparées par des espaces}
	begin

	for i in mot'range loop
		ecrire(mot(i));
		ecrire(" ");
	end loop;

	end Affiche;

	function IndMin(V: in string) return integer is
	j :integer := V'first;
	min : character := V(V'first);
	begin
	
	for i in V'first+1..V'last loop
		if V(i)<= min then
			min:=V(i);
			j:=i;
		end if;
	end loop;
	return j;

	end IndMin;

	

	function Squelette(mot: in T_mot) return T_mot is
	--{} => {résultat = chaîne constituée des lettres de mot, triées par ordre alphabétique}
	mottrie : T_mot;
	i,j : integer;
	permut: character;
	begin
	mottrie:=mot;
	i:=mottrie'first;

	


	while i < mottrie'last loop
		
		j:=IndMin(mottrie(i..mottrie'last));
		
		if j /= i then
			permut:=mottrie(i);
			mottrie(i):=mottrie(j);
			mottrie(j):=permut;
		end if;

		i:=i+1;


	end loop;

	return mottrie;

	end Squelette;


	----------------------------------------------------------------------------------------------
	-- 2 : RECHERCHE DANS UN FICHIER (sans prise en compte du tri)
	----------------------------------------------------------------------------------------------
	function NBPoints(mot: in T_mot) return natural is
	--{} => {résultat = nombre de points rapportés par mot}
	nb: integer;
	begin

	nb:=0;

	for i in mot'range loop
	nb:=nb+VPoints(mot(i));
	end loop;

	return nb;

	end NBPoints;


	function MaxPoints(f : in p_mot_io.file_type) return natural is
	--{f ouvert en lecture, f-= <>} => {résultat = maximum des points rapportés par un mot de f}
	c: T_mot;
	max :natural;
	begin
	read(f,c);
	max:=NBPoints(c);
	while not end_of_file(f) loop
		read(f,c);
		if max < NBPoints(c) then
			max:=NBPoints(c);
		end if;
	end loop;
	return max;

	end MaxPoints;

	procedure MotsGagnants(f : in out p_mot_io.file_type) is
	--{f ouvert} =>{Les mots de f rapportant le maximum de points sont affichés ligne à ligne}
	c : T_Mot;
	maxim: natural;
	begin
	reset(f,in_file);
	maxim:=MaxPoints(f);
	reset(f,in_file);
	while not end_of_file(f) loop
		read(f,c);
			if NBPoints(c)=maxim then
			ecrire_ligne(c);
			end if;
	end loop;
	end MotsGagnants;

	function Anagramme(mot1, mot2: in T_mot) return boolean is
	--{} => {résultat = vrai si mot1 et mot2 sont des anagrammes}
	Squel1, Squel2 : T_Mot;
	begin

	Squel1:=Squelette(mot1);
	Squel2:=Squelette(mot2);
	if Squel1=Squel2 then
		return true;
	else
		return false;
	end if;
		
	end Anagramme;
	----------------------------------------------------------------------------------------------
	-- 3 : RECHERCHE DANS UN FICHIER trié par ordre alphabétique
	----------------------------------------------------------------------------------------------
	function Existe(f: in p_mot_io.file_type; mot:in T_mot) return boolean is
	--{f ouvert, f trié, f-= <>}=> {résultat= true si mot est présent dans f}
	c: T_mot;
	begin
		while not end_of_file(f) loop
			read(f,c);
			if c=mot then
				return true;
			end if;
		end loop;
		return false;

	end Existe;


	procedure CreeFicMots (f: in out p_mot_io.file_type; car:in character;g : in out p_mot_io.file_type) is
	--{f ouvert et trié, g ouvert} => --{g contient les mots de f commençant par car; le nombre d'éléments de g est affiché}
		c: T_mot;
		nb:integer;
	begin
		nb:=0;
		reset(f,in_file);
		while not end_of_file(f) loop
			read(f,c);
			if c(c'first)=car then
				write(g,c);
				nb:=nb+1;
			end if;
		end loop;

		ecrire("Nb d'éléments de g : ");
		ecrire_ligne(nb);		


	end CreeFicMots;



	
	----------------------------------------------------------------------------------------------
	-- 4 : SCRABBLES
	----------------------------------------------------------------------------------------------
	function NbJoker(tirage: in string) return natural is
	--{} => {résultat = nombre de caractères joker (@) contenus dans tirage}
	nb:natural;
	begin
	nb:=0;
	for i in tirage'range loop
		if tirage(i)='@' then
			nb:=nb+1;
		end if;
	end loop;

	return nb;

	end NbJoker;

	procedure AfficheJeu(jeu : in string) is 
	--{} => {affiche sur deux lignes les caractères de jeu, séparés par un espace}
	begin
	for i in jeu'range loop
		if i=4 then
			ecrire_ligne("");
		end if;

		ecrire(jeu(i));
		ecrire(" ");

	end loop;
	 

	end AfficheJeu;


	function Estla(mot: in string; car: in character) return boolean is
	begin

	for i in mot'range loop
		if mot(i)=car then
			return true;
		end if;
	end loop;
	return false;

	end Estla;

	function Mapping(tirage : in string;mot: in T_mot) return boolean is
	--{mot ne comporte que des majuscules}--=> {résultat = vrai si mot peut être écrit avec tirage, exemple : Mapping("RINTES@", "SERINAT") = true}

	Squel1: string:=Squelette(tirage);
	Squel2: string:=Squelette(mot);
	NbJ: natural:=NbJoker(tirage);
	j :integer;
	begin
	
	j:=Squel2'first;
	if NbJ=0 then
		NbJ:=1;
	end if;
	
	for i in Squel1(NbJ+1..Squel1'last)'range loop
		ecrire_ligne(Squel2(j..Squel2'last));

		if Estla(Squel2(j..Squel2'last),Squel1(i))= false then
			return false;
		end if;
		j:=j+1;
	end loop;

	return true;
	


	end Mapping;

	procedure LesScrabbles(f: in out p_mot_io.file_type; tirage: string) is
	Nb: integer;
	c: T_mot;
	begin
	Nb:=0;
	reset(f, in_file);

	while not end_of_file(f) loop
		read(f,c);
		
		if Mapping(tirage,c) then
			ecrire_ligne(c);
			Nb:=Nb+1;
		end if;
	end loop;

	ecrire("NB de Scrabbles :");
	ecrire_ligne(Nb);
		

	end LesScrabbles;

end p_scrabble;

