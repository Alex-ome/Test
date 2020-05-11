--------------------------------------------------------------------------------------------------------------------
-- À NE PAS MODIFIER....
--------------------------------------------------------------------------------------------------------------------
with sequential_io;
with text_io; use text_io;

package p_eclipse is





	-- Pour représenter la date d'une éclipse
   subtype T_Jour is Positive range 1..31;
   type T_Mois is (Janvier, Fevrier, Mars, Avril, Mai, Juin, Juillet, Aout, Septembre, Octobre, Novembre, Decembre);
   subtype T_Annee is Integer range 1998..2021;
   type TR_Date is record 
         Jour  : T_Jour;
         Mois  : T_Mois;
         Annee : T_Annee;
   end record; 

	-- Pour représenter l'instant (h/mn/sec) du maximum d'une éclipse
   type TR_Horaire is record
   	Heure : integer range 0..23;
   	Min : integer range 0..60;
   	Sec : integer range 0..60;
   end record;

	-- Pour représenter la catégorie d'une éclipse
   type T_Categorie is (Partielle, Totale, Annulaire, Hybride);
 
	-- Pour représenter la magnitude d'une éclipse
	subtype T_Magnitude is Float range 0.00..2.00;

	-- Pour représenter une éclipse
   type TR_Eclipse is record
         Date         : TR_Date;        -- date
         Categorie    : T_Categorie;    -- catégorie
         HMaxi		    : TR_Horaire;     -- instant du maximum
         Magnitude    : T_Magnitude;    -- magnitude
   end record;
	


   -- Instanciations
   package p_cat_io is new enumeration_io(T_Categorie); use p_cat_io;
   package p_mois_io is new enumeration_io(T_Mois); use p_mois_io;
   package p_int_io is new integer_io(integer); use p_int_io;
   package p_float_io is new float_io(float); use p_float_io;
   package p_eclipse_io is new sequential_io(TR_Eclipse); use p_eclipse_io;

--------------------------------------------------------------------------------------------------------------------
-- À COMPLETER ci-dessous au fil des questions
--------------------------------------------------------------------------------------------------------------------
function Avant (d1,d2 : in TR_Date) return boolean;

procedure Affiche (E : in TR_Eclipse);

procedure Affiche (f : in p_eclipse_io.file_type);

function TestTri (f :in p_eclipse_io.file_type) return boolean;
--{f ouvert en lecture, f-= <>} --=> {résultat= vrai si le fichier f est trie au sens strict sur les dates}

procedure Recherche (f :in out p_eclipse_io.file_type; D :in TR_Date);
--{f ouvert en lecture, trié sur les dates} 
--=> {les caractéristiques de l'éclipse de date D sont affichées si elle existe dans f, sinon un message signifiant qu’il n’y a pas d’éclipse à cette date est affiché}

procedure Selection (f, fres: in out p_eclipse_io.file_type; Cat: in T_categorie);
--{f et fres ouverts} => {fres contient les éclipses de f ayant la catégorie Cat}

procedure Inter(f : in out p_eclipse_io.file_type; g : in out text_io.file_type; D1, D2 : in TR_Date);
--{f ouvert et trié sur les dates, D1 < D2, g ouvert} 
--=>{g contient les éclipses de f dont la date est comprise dans [D1,D2[ avec
--une ligne par éclipse présentée sous la forme: date-catégorie une dernière ligne où figure le nombre d’éclipses trouvées}

end p_eclipse;
