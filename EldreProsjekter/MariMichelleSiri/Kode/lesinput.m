function [npunkt, punkt, nelem, elem, last_punkt, last_moment,...
    last_fordelt, nlast_punkt, nlast_fordelt, nmoment, nprofil,...
    profil]=lesinput()

%       %i = heltall (integer)       %f : desimaltall (flyt-tall)

%aapner inputfila
filid = fopen('inputfilC.txt','r');


%% Knutepunkter, profiler og elementer

%Antall knutepunkter konstruksjonen bestaar av
npunkt = fscanf(filid,'%i',[1 1]);


% LESER INN XY-KOORDINATER TIL KNUTEPUNKTENE
% Nodenummer tilsvarer radnummer i "Node-variabel"
% x-koordinat lagres i forste kolonne, y-koordinat i 2.kolonne
% Grensebetingelse lagres i kolonne 3, fast innspent=1 og fri rotasjon=0
punkt = fscanf(filid,'%f %f %i',[3, npunkt])';


%Antall ulike bjelke profiler
nprofil=fscanf(filid,'%i',[1, 1]);

%LESER PROFILDIMMENSJONER
  %Kolonne 1: Profiltype, 0 for ror, 1 for I-profil
  %Kolonne 2: Dimensjon 1 Radisus for ror, total hoyde for I-profil
  %Kolonne 3: Dimensjon 2 tykkelse for ror, tykkelse bunnflens for I-profil
  %Kolonne 4: Dimensjon 3 null for ror, tykkelse toppflens for I-profil
  %Kolonne 5: Dimensjon 4 null for ror, tykkelse steg for I-profil
  %Kolonne 6: Dimensjon 5 null for ror, bredde bunnflens for I-profil
  %Kolonne 7: Dimensjon 6 null for ror, bredde toppflens I-profil
profil = fscanf(filid,'%i %f %f %f %f %f %f',[7, nprofil])';

%Antall elementer konstruksjonen bestaar av
nelem = fscanf(filid,'%i',[1, 1]);

%LESER KONNEKTIVITET
%sammenheng mellom elementer, knutepunktnummer,E-modul og bjelketverrsnitt.
% Elementnummer tilsvarer radnummer
    % Kolonne 1: Globalt knutepunktnummer for lokal ende 1
    % Kolonne 2: Globalt knutepunktnummer for lokal ende 2
    % Kolonne 3: E-modul for materialet
    % Kolonne 4: Tverrsnittstype, nummeret som oppgis svarer til de 
%oppgitte profilene 
elem = fscanf(filid,'%i %i %f %i',[4, nelem])';

%% Lineaert fordelt last
%Antall lineaere-laster. 
nlast_fordelt = fscanf(filid,'%i',[1, 1]);

%Leser hvor mange elementer den lasten som gaar over flest elementer gaar
%over. Dette er nodvendig for aa faa rikitg matrisedimmensjon
nlengste_fordelt = fscanf(filid,'%i',[1, 1]);

%Lager en string med variabelsymboler
nelement_string = '';
for i = 1:nlengste_fordelt;
    nelement_string = [nelement_string, ' %i'];
end

%LESER LASTDATA FOR LINEARE LASTER
    %Kolonne 1:   Antall elementer lasten gaar over
    %Kolonne 2:   Laststorrelse i knutpunktet lengst ned og til venstre
    %Kolonne 3:   Laststorrelse i knutepunktet lengst opp og til hoyre
    %Kolonne 4->: Elementene lasten gaar over
last_fordelt = fscanf(filid,['%i %f %f', nelement_string],...
    [nlengste_fordelt+3, nlast_fordelt])';

%% Punktlast
%Antall punktlaster
nlast_punkt = fscanf(filid,'%i',[1, 1]);

%LESER PUNKTLASTER
    %Kolonne 1: Aktuelt element
    %Kolonne 2: Storrelse, positiv er mot hoyre og ned
    %Kolonne 3: Avstand fra last til lokalt knutepunkt 1
    %Kolonne 4: Vinkel i forhold til normalen til bjelken i grader
last_punkt = fscanf(filid,'%i %f %f %f', [4, nlast_punkt])';

%% Ytre moment
%Antall momenter
nmoment=fscanf(filid,'%i',[1, 1]);

%LESER MOMENTER
    %Kolonne 1: Knutepunkt
    %Kolonne 2: Storrelse, positiv med klokken
last_moment = fscanf(filid,'%i %f',[2, nmoment])';

%% LUKKER INPUT-FILEN
fclose(filid);
end