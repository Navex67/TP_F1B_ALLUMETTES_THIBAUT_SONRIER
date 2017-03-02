{//ALGORITHME : Allumettes
//BUT : Le jeu se joue a deux et se partagent 21 allumettes, chacun a tour de role doit retirer 1,2 ou 3 allumettes. Le dernier joueur qui retire la derniere allumette à perdu
//ENTREE : Deux joueurs, les allumettes a retirés
//SORTIE : La victoire ou la defaite d'un deux joueurs




PROCEDURE PSEUDOJ1 (var nameJ1 : CHAINE)
//BUT : Demander a l'utilisateur d'écrire son pseudo
//ENTREE : Le nom du joueur 1
//SORTIE : Le nom du joueur 1


DEBUT

	ECRIRE 'Bienvenu dans le jeu de nim ! '
	ECRIRE ''
	ECRIRE '------------------------------------'
	ECRIRE 'Veuillez saisir le nom du JOUEUR 1 : '
	LIRE nameJ1

	REPETER
	DEBUT
		SI (length(nameJ1) > 8) OU (length(nameJ1) < 1) ALORS

			ECRIRE ('ERREUR ! 8 caractere MAXIMUM JOUEUR1 ! RESAISIR : ') 
			LIRE nameJ1

		FINSI

	FINREPETER
	JUSQU'A (length(nameJ1) <= 8) ET (length(nameJ1) >= 1)

FIN PROCEDURE


PROCEDURE PSEUDOJ2(var nameJ2 : CHAINE)
//BUT : Demander a l'utilisateur d'écrire son pseudo
//ENTREE : Le nom du joueur 2
//SORTIE : Le nom du joueur 2

DEBUT

	ECRIRE '------------------------------------'
	ECRIRE 'Veuillez saisir le nom du JOUEUR 2 : '
	LIRE nameJ2

	REPETER
	DEBUT
		SI (length(nameJ2) > 8) OU (length(nameJ2) < 1) ALORS
		
			ECRIRE ('ERREUR ! 8 caractere MAXIMUM JOUEUR1 ! RESAISIR : ') 
			LIRE nameJ2

		FINSI

	FINREPETER
	JUSQU'A (length(nameJ2) <= 8) ET (length(nameJ2) >= 1)

FIN PROCEDURE

FONCTION RANDJOUEUR(var joueur:CHAINE & nameJ1:CHAINE & nameJ2:CHAINE):CHAINE
//BUT : Fonction pour tirer un joueur aléatoirement en premier
//ENTREE : les noms des joueurs et une variable pour stocker l'alea
//SORTIE : la variable de stockage dans la fonction pour l'utiliser plus tard

VAR
	i:ENTIER

DEBUT

	i <- random(2)+1
	SI i=1 ALORS
		joueur <-nameJ1
	SINON
	joueur <- nameJ2

	RANDJOUEUR <- joueur
FINFONCTION

PROCEDURE TOURJEU(var reste,Apick : ENTIER & nameJ1,nameJ2,joueur:CHAINE)
//BUT : boucle principal du jeu et tests pour vérifié si les joueurs tire 1,2 ou 3 allumettes ni plus ni moins
//ENTREE : les noms des joueur, le tas d'allumette, et les allumettes que tire les joueurs
//SORTIE :L'alumette que le joueur a tiré soustrait au tas d'allumette (le reste)


DEBUT

	//test qui permet de forcer le joueur a prendre 1 allumette si il en reste 2
	SI (reste = 2)  ALORS 
	

			REPETER
			DEBUT
				
				LIRE Apick

			FINREPETER
			JUSQU'A Apick=1

			reste <- reste-Apick

			ECRIRE '------------------------------------'
			ECRIRE 'Il reste : ',reste,' allumettes'
			
		

	SINON
    	
	//Boucle et test qui permet au joueur de prendre uniquement 1,2 ou 3 allumette et le soustraire du reste sinon il recommence la saisie
		REPETER
			DEBUT
				ECRIRE '------------------------------------'
				ECRIRE 'Au tour du joueur : ' & joueur
				ECRIRE 'Prendre de 1 a 3 allumettes'
				LIRE Apick

				SI (Apick<=0) OU (Apick>3) ALORS   
				
					ECRIRE 'Vous avez saisie une valeur qui n''est pas compris entre 1 et 3 ! RECOMMENCER LA SAISIE'
				

				SINON
			
					reste:=reste-Apick;
					ECRIRE '------------------------------------'
					ECRIRE('Il reste : ',reste,' allumettes'

			FINREPETER
		JUSQU'A (Apick=1) OU (Apick=2) OU (Apick=3)

	FINSI
	

	//test pour changer les roles des joueurs a chaque fin de tour de jeu
	SI reste>0 ALORS
	
		SI (joueur = nameJ1) ALORS
			joueur <- nameJ2
		SINONSI (joueur=nameJ2) ALORS
			joueur <- nameJ1
	FINSI


FINPROCEDURE



PROCEDURE affichTOUR (VAR nameJ1,nameJ2,joueur : CHAINE & reste , Apick : CHAINE)
//BUT : Afficher le tour de jeu jusqu'a que le reste est egale a 0
//ENTREE : la procedure TOURJEU dans une boucle
//SORTIE : l'affichage de tout a chaque tour
	
DEBUT

		REPETER
		DEBUT
		
		TOURJEU(reste,Apick,nameJ1,nameJ2,joueur)
		
		FINREPETER
		JUSQU'A reste<=0
 

FINPROCEDURE	


//--------- PROGRAMME PRINCIPAL ---------

VAR
	reste,Apick:ENTIER
	nameJ1,nameJ2,joueur:CHAINE
	

DEBUT



	// --------- INITIALISATIONS DES PSEUDOS -----------
	PSEUDOJ1(nameJ1)
	PSEUDOJ2(nameJ2)

	//---------- CHOIX ALEATOIRE DU JOUEUR QUI COMMENCE ----------
	joueur <- RANDJOUEUR(joueur,nameJ1,nameJ2)
	writeln 'Le JOUEUR qui COMMENCE EST : ',joueur


	reste <- 21 

	//---------- BOUCLE DE JEU -----------
	affichTOUR( nameJ1,nameJ2,joueur, reste , Apick)

	//--------- FIN BOUCLE AFFICHAGE DU PERDANT ----------
	
	ECRIRE 'LE JOUEUR : ',joueur, ' A PERDU !'



	
FIN }












program EXO_Allumettes2;
//ALGORITHME : Allumettes
//BUT : Le jeu se joue a deux et se partagent 21 allumettes, chacun a tour de role doit retirer 1,2 ou 3 allumettes. Le dernier joueur qui retire la derniere allumette à perdu
//ENTREE : Deux joueurs, les allumettes a retirés
//SORTIE : La victoire ou la defaite d'un deux joueurs

uses crt;


PROCEDURE PSEUDOJ1 (var nameJ1 : STRING);
//BUT : Demander a l'utilisateur d'écrire son pseudo
//ENTREE : Le nom du joueur 1
//SORTIE : Le nom du joueur 1


BEGIN

	writeln('Bienvenu dans le jeu de nim ! ');
	writeln('');
	writeln('------------------------------------');
	Write ('Veuillez saisir le nom du JOUEUR 1 : ');
	readln(nameJ1);

	REPEAT	

		BEGIN
		IF (length(nameJ1) > 8) OR (length(nameJ1) < 1) THEN
		BEGIN
			Write ('ERREUR ! 8 caractere MAXIMUM JOUEUR1 ! RESAISIR : ') ;
			readln(nameJ1);
		END;

		END;
	UNTIL (length(nameJ1) <= 8) AND (length(nameJ1) >= 1);

END;


PROCEDURE PSEUDOJ2(var nameJ2 : STRING);
//BUT : Demander a l'utilisateur d'écrire son pseudo
//ENTREE : Le nom du joueur 2
//SORTIE : Le nom du joueur 2

BEGIN

	writeln(' ');
	writeln('------------------------------------');
	Write ('Veuillez saisir le nom du JOUEUR 2 : ');
	readln(nameJ2);

	REPEAT
		BEGIN

		IF (length(nameJ2) > 8) OR (length(nameJ2) < 1) THEN
		BEGIN
			Write ('ERREUR ! 8 caractere MAXIMUM JOUEUR2 ! RESAISIR :') ;
			readln(nameJ2);
		END;

		END;
	UNTIL (length(nameJ2) <= 8) AND (length(nameJ2) >= 1);

END;

FUNCTION RANDJOUEUR(var joueur:string; nameJ1:string; nameJ2:string):string;

//BUT : Fonction pour tirer un joueur aléatoirement en premier
//ENTREE : les noms des joueurs et une variable pour stocker l'alea
//SORTIE : la variable de stockage dans la fonction pour l'utiliser plus tard

var
	i:integer;

BEGIN

	i:=random(2)+1;
	if i=1 then
		joueur:=nameJ1
	ELSE
	joueur:=nameJ2;

	RANDJOUEUR:=joueur;

END;

PROCEDURE TOURJEU(var reste,Apick : integer; nameJ1,nameJ2,joueur:string);
//BUT : boucle principal du jeu et tests pour vérifié si les joueurs tire 1,2 ou 3 allumettes ni plus ni moins
//ENTREE : les noms des joueur, le tas d'allumette, et les allumettes que tire les joueurs
//SORTIE :L'alumette que le joueur a tiré soustrait au tas d'allumette (le reste)


BEGIN
	
	//test qui permet de forcer le joueur a prendre 1 allumette si il en reste 2
	IF( reste = 2) OR (reste = 1)  THEN
		begin

			REPEAT
				BEGIN
				
				readln (Apick);

				END;
			UNTIL (Apick=1);

			reste:=reste-Apick;
			writeln('------------------------------------');
			writeln('Il reste : ',reste,' allumettes');
			
		end	

	ELSE
    BEGIN
    //Boucle et test qui permet au joueur de prendre uniquement 1,2 ou 3 allumette et le soustraire du reste sinon il recommence la saisie

		REPEAT
			BEGIN

				writeln('------------------------------------');
				writeln('Au tour du joueur : ',joueur);
				writeln('Prendre de 1 a 3 allumettes');
				readln(Apick);

				IF (Apick<=0) OR (Apick>3) THEN
				begin
					writeln('Vous avez saisie une valeur qui n''est pas compris entre 1 et 3 ! RECOMMENCER LA SAISIE');
				end

				ELSE
				begin
					reste:=reste-Apick;
					writeln('------------------------------------');
					writeln('Il reste : ',reste,' allumettes')
				end;

			END;
		UNTIL (Apick=1) OR (Apick=2) OR (Apick=3);

	END;


	//test pour changer les roles des joueurs a chaque fin de tour de jeu

	IF reste>0 then
	BEGIN
		IF (joueur = nameJ1) then
			joueur:=nameJ2
		ELSE IF (joueur=nameJ2) then
			joueur:=nameJ1;
	END;

END;



PROCEDURE affichTOUR (VAR nameJ1,nameJ2,joueur : STRING ; reste , Apick : INTEGER);	
//BUT : Afficher le tour de jeu jusqu'a que le reste est egale a 0
//ENTREE : la procedure TOURJEU dans une boucle
//SORTIE : l'affichage de tout a chaque tour
	
BEGIN

		REPEAT
		
		TOURJEU(reste,Apick,nameJ1,nameJ2,joueur);
	
		UNTIL reste<=0;
 

END;	


//--------- PROGRAMME PRINCIPAL ----------
VAR
	reste,Apick:integer;
	nameJ1,nameJ2,joueur:string;
	

BEGIN

	randomize;

	clrscr;
	// --------- INITIALISATIONS DES PSEUDOS -----------
	PSEUDOJ1(nameJ1);
	PSEUDOJ2(nameJ2);

	//---------- CHOIX ALEATOIRE DU JOUEUR QUI COMMENCE ----------
	joueur:=RANDJOUEUR(joueur,nameJ1,nameJ2);
	writeln('Le JOUEUR qui COMMENCE EST : ',joueur);


	reste := 21 ;

	//---------- BOUCLE DE JEU -----------
	affichTOUR( nameJ1,nameJ2,joueur, reste , Apick);

	//--------- FIN BOUCLE AFFICHAGE DU PERDANT ----------
	clrscr;
	writeln('LE JOUEUR : ',joueur, ' A PERDU !');


	readln;
	
END.


