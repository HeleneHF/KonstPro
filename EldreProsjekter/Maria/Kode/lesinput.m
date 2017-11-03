function [npunkt, punkt, nelem, elem, nprofil, profil, nlast, last] = lesinput()
%{
LESINPUT: Henter inn informasjon fra inputfilen og lagrer det i variable
matlab kan bruke og som videre kan brukes til utregnigene for rammen.

NB: i = heltall (integer (heltall)) %f : desimaltall (flyttall)
OUTPUT: 
* npunkt = integer, antall knutepunkter
* punkt = npunkt x 3 - matrise, lagrer knutepunktenes koordinater og
  kode for grensebetingelsenes
* nelem = integer, antall elementer
* elem = nelem x 4 - matrise, lagrer nummeret til endepunkene til elementene,
  samt e-modul og kode for tverrsnittstype. 
* nprofil = integer, antall ulike profiler
* profil = nprofil x 5 -matrise, all info for hver profiltype, h�yde, bredde
  osv.
* nlast = integer, antall laster som virker
* last = nlast x 5 - matrise, lagrer type last, hvilket element eventuelt knutepunkt
  det virker p�, med hvilken intensitet og eventuelt med hvilken vinkel i
  forhold til elemtet/lokale akser
%}

% �pner inputfila
filid = fopen('input_C.txt','r');


% Leser hvor mange punkt det er
npunkt = fscanf(filid,'%i',[1 1]);


% LESER INN XY-KOORDINATER TIL KNUTEPUNKTENE
% Nodenummer tilsvarer radnummer i "Node-variabel"
% x-koordinat lagres i f�rste kolonne, y-koordinat i 2.kolonne
% Grensebetingelse lagres i kolonne 3, fast innspent=1 og fri rotasjon=0
punkt = fscanf(filid,'%f %f %i',[3 npunkt])';


%Leser hvor mange element det er
nelem = fscanf(filid,'%i',[1 1]);


% Leser konnektivitet: sammenheng elementender og knutepunktnummer. Og EI for elementene
% Elementnummer tilsvarer radnummer i "Elem-variabel"
% Knutepunktnummer for lokal ende 1 lagres i kolonne 1
% Knutepunktnummer for lokal ende 2 lagres i kolonne 2
% E-modul for materiale lagres i kolonne 3
% Tverrsnittstype lagres i kolonne 4, boksprofil=1 og r�rprofil=2  
elem = fscanf(filid,'%i %i %f %i',[4 nelem])';

% Leser hvor mange profiler det er(Merk at programmet er laget for to)
nprofil = fscanf(filid, '%i',[1,1]);

% Leser tverrsnittsdata. Kolonne 1 = profiltype (1=boks og 2=r�r)
% Kolonne 2 er h�yde indre/diameter r�r
% Kolonne 3 er tykkelse r�r/h�yde ytre
% Kolonne 4 er bredde indre (vil v�re 0 for r�r)
% Kolonne 5 er bredde ytre (vil v�re 0 for r�r) 
profil= fscanf(filid, '%f %f %f %f %f',[5 nprofil])';

% Leser hvor mange laster som virker. 
nlast = fscanf(filid,'%i',[1 1]);


% Leser lastdata
% Kolonne 1 representerer hvilken type last det er. 1=punktlast 2=Jevnt
% fordelt, 3=line�rt fordelt og 4=p�satt moment.
% Kolonne 2: Hvilket bjelkeelement den virker p�(For
% moment=knutepunkt)
% Kolonne 3: Lastens avstand til lokal ende 1 p� bjelkeelementet, alpha.
% (Hvis jevn, oppgi 1. Hvis line�r, oppgi 1 hvis max i LE 1 og 2 hvis max i LE 2)
% (For moment=0)
% Kolonne 4: Lastens st�rrelse i Newton(/M eller M)
% Kolonne 5: Vinkel i grader(=0 for alt annet enn punktlast)
last = fscanf(filid,'%i %f %f %f %f',[5 nlast])';

% LUKKER INPUT-FILEN
fclose(filid);

end
