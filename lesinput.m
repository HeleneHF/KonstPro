function [npunkt,punkt,nelem,elem,nlast,last] = lesinput()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    lesinput                                                      %
% Funksjon: Leser inn nødvending informasjon om konstruksjonen og lastene %
%           fra en forhåndsdefinert inputfil med nødvendig data.          %
%           tilhørende lastene                                            %
% Oppdatert: 2017-10-17                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Bestem om man skal hovedoppgaven eller testfila       MIDLERTIDIG!!!
test = true; 

% Tilbake melding til brukeren
fprintf('Regner ut lengden av elementene...\n')

% Åpner inputfila
if (test)
    filid = fopen('input_c.txt','r');
    fprintf('Leser inn oppgave c\n'); 
else 
    filid = fopen('input.txt','r');
    fprintf('Leser inn hovedoppgaven\n');
end
 
% Leser antall punker
npunkt = fscanf(filid,'%i',[1 1]);


% LESER INN XY-KOORDINATER TIL KNUTEPUNKTENE
% Nodenummer tilsvarer radnummer i "Node-variabel"
% x-koordinat lagres i første kolonne, y-koordinat i 2.kolonne
% Grensebetingelse lagres i kolonne 3, fast innspent=1 og fri rotasjon=0
punkt = fscanf(filid,'%f %f %i',[3 npunkt])';


% Leser antall elementer 
nelem = fscanf(filid,'%i',[1 1]);


% Leser konnektivitet: sammenheng elementender og knutepunktnummer. Og EI for elementene
% Elementnummer tilsvarer radnummer i "Elem-variabel"
% Knutepunktnummer for lokal ende 1 lagres i kolonne 1
% Knutepunktnummer for lokal ende 2 lagres i kolonne 2
% E-modul for materiale lagres i kolonne 3
% Tverrsnittstype lagres i kolonne 4, I-profil=1 og rørprofil=2  
elem = fscanf(filid,'%i %i %f %i',[4 nelem])';


% Leser antall laster 
nlast = fscanf(filid,'%i',[1 1]);


% Leser lastdata
% OPPGAVE: Bestem selv hvilke verdiene som er nødvendig å lese inn, og hva verdiene som leses inn
% skal representere
last = fscanf(filid,'%i %f %f %f',[4 nlast])';


% LUKKER INPUT-FILEN
fclose(filid);

% Tilbake melding til brukeren
fprintf('Informasjon lastet inn\n')
end
