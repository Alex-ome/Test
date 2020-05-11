with p_esiut; use p_esiut;
with sequential_io;

package p_scrabble is

	----------------------------------------------------------------------------------------------
	-- PARTIE A NE PAS MODIFIER
	----------------------------------------------------------------------------------------------
	
	subtype T_jeton is character range '@'..'Z'; -- '@' et les majuscules de 'A' à 'Z' non accentuées
	
	type TV_points is array (T_jeton) of natural;
	
	VPoints : constant TV_points := ('K'|'W'..'Z' => 10, 'J'|'Q' => 8, 'F'|'H'|'V' => 4, 'B'|'C'|'P' => 3,
												'D'|'G'|'M' => 2, '@' => 0, others => 1);
	
	subtype T_mot is string(1..7);
	package p_mot_io is new sequential_io(T_mot); use p_mot_io ;

	function MelangeJetons return string ;
	--{} => {résultat = chaîne représentant les 102 jetons du srabble français rangés aléatoirement}
	
	procedure TirageSansRemise(Jeu : in out string; tirage : out string);
	--{le caractère '.' représente un jeton de Jeu précédemment tiré} 
	--	=> {tirage est constitué de caractères choisis aléatoirement parmi les jetons disponibles de Jeu
	--		 Jeu est mis à jour (chaque jeton tiré est représenté par un espace}
		
	----------------------------------------------------------------------------------------------
	-- PARTIE A COMPLETER
	----------------------------------------------------------------------------------------------
	-- 1 : INTRODUCTION
	----------------------------------------------------------------------------------------------
	procedure Affiche(mot: in T_mot);
	--{} => {les lettres de motsont affichées sur une ligne, séparées par des espaces}

	function IndMin(V: in string) return integer;

	function Squelette(mot: in T_mot) return T_mot;
	--{} => {résultat = chaîne constituée des lettres de mot, triées par ordre alphabétique}
	----------------------------------------------------------------------------------------------
	-- 2 : RECHERCHE DANS UN FICHIER (sans prise en compte du tri)
	----------------------------------------------------------------------------------------------
	function NBPoints(mot: in T_mot) return natural;
	--{} => {résultat = nombre de points rapportés par mot}

	function MaxPoints(f : in p_mot_io.file_type) return natural;
	--{f ouvert en lecture, f-= <>} => {résultat = maximum des points rapportés par un mot de f}

	procedure MotsGagnants(f : in out p_mot_io.file_type);
	--{f ouvert} =>{Les mots de f rapportant le maximum de points sont affichés ligne à ligne}
	
	function Anagramme(mot1, mot2: in T_mot) return boolean;
	--{} => {résultat = vrai si mot1 et mot2 sont des anagrammes}
	----------------------------------------------------------------------------------------------
	-- 3 : RECHERCHE DANS UN FICHIER trié par ordre alphabétique
	----------------------------------------------------------------------------------------------
	function Existe(f: in p_mot_io.file_type; mot:in T_mot) return boolean;
	--{f ouvert, f trié, f-= <>}=> {résultat= true si mot est présent dans f}

	procedure CreeFicMots (f: in out p_mot_io.file_type; car:in character;g : in out p_mot_io.file_type);
	--{f ouvert et trié, g ouvert} => --{g contient les mots de f commençant par car; le nombre d'éléments de g est affiché}
	----------------------------------------------------------------------------------------------
	-- 4 : SCRABBLES 
	----------------------------------------------------------------------------------------------
	function NbJoker(tirage: in string) return natural;
	--{} => {résultat = nombre de caractères joker (@) contenus dans tirage}

	procedure AfficheJeu(jeu : in string);
	--{} => {affiche sur deux lignes les caractères de jeu, séparés par un espace}

	function Estla(mot: in string; car: in character) return boolean;

	function Mapping(tirage : in string;mot: in T_mot) return boolean;
	--{mot ne comporte que des majuscules}--=> {résultat = vrai si mot peut être écrit avec tirage, exemple : Mapping("RINTES@", "SERINAT") = true}

	procedure LesScrabbles(f: in out p_mot_io.file_type; tirage: string);
	--{f ouvert, tirage peut comporter des jokers} => --{affiche les mots de f pouvant être écrits avec tirage, puis affiche le nombre de ces mots (qu’on appelle scrabbles)}
	
end p_scrabble;

