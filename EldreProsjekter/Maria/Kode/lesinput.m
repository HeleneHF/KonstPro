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
* profil = nprofil x 5 -matrise, all info for hver profiltype, høyde, bredde
  osv.
* nlast = integer, antall laster som virker
* last = nlast x 5 - matrise, lagrer type last, hvilket element eventuelt knutepunkt
  det virker på, med hvilken intensitet og eventuelt med hvilken vinkel i
  forhold til elemtet/lokale akser
%}

% Åpner inputfila
filid = fopen('input_C.txt','r');


% Leser hvor mange punkt det er
npunkt = fscanf(filid,'%i',[1 1]);


% LESER INN XY-KOORDINATER TIL KNUTEPUNKTENE
% Nodenummer tilsvarer radnummer i "Node-variabel"
% x-koordinat lagres i første kolonne, y-koordinat i 2.kolonne
% Grensebetingelse lagres i kolonne 3, fast innspent=1 og fri rotasjon=0
punkt = fscanf(filid,'%f %f %i',[3 npunkt])';


%Leser hvor mange element det er
nelem = fscanf(filid,'%i',[1 1]);


% Leser konnektivitet: sammenheng elementender og knutepunktnummer. Og EI for elementene
% Elementnummer tilsvarer radnummer i "Elem-variabel"
% Knutepunktnummer for lokal ende 1 lagres i kolonne 1
% Knutepunktnummer for lokal ende 2 lagres i kolonne 2
% E-modul for materiale lagres i kolonne 3
% Tverrsnittstype lagres i kolonne 4, boksprofil=1 og rørprofil=2  
elem = fscanf(filid,'%i %i %f %i',[4 nelem])';

% Leser hvor mange profiler det er(Merk at programmet er laget for to)
nprofil = fscanf(filid, '%i',[1,1]);

% Leser tverrsnittsdata. Kolonne 1 = profiltype (1=boks og 2=rør)
% Kolonne 2 er høyde indre/diameter rør
% Kolonne 3 er tykkelse rør/høyde ytre
% Kolonne 4 er bredde indre (vil være 0 for rør)
% Kolonne 5 er bredde ytre (vil være 0 for rør) 
profil= fscanf(filid, '%f %f %f %f %f',[5 nprofil])';

% Leser hvor mange laster som virker. 
nlast = fscanf(filid,'%i',[1 1]);


% Leser lastdata
% Kolonne 1 representerer hvilken type last det er. 1=punktlast 2=Jevnt
% fordelt, 3=lineært fordelt og 4=påsatt moment.
% Kolonne 2: Hvilket bjelkeelement den virker på(For
% moment=knutepunkt)
% Kolonne 3: Lastens avstand til lokal ende 1 på bjelkeelementet, alpha.
% (Hvis jevn, oppgi 1. Hvis lineær, oppgi 1 hvis max i LE 1 og 2 hvis max i LE 2)
% (For moment=0)
% Kolonne 4: Lastens størrelse i Newton(/M eller M)
% Kolonne 5: Vinkel i grader(=0 for alt annet enn punktlast)
last = fscanf(filid,'%i %f %f %f %f',[5 nlast])';

% LUKKER INPUT-FILEN
fclose(filid);

end
