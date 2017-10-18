function [npunkt,punkt,nelem,elem,nlast,last,nTver,profil] = lesinput()

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
fprintf('Starter innlesning...\n')

% Åpner inputfila
if (test)
    filid = fopen('inputC.txt','r');
    fprintf('Leser inn oppgave c...\n'); 
else 
    filid = fopen('input.txt','r');
    fprintf('Leser inn hovedoppgaven...\n');
end

%% Knutepunkt og elementer
% Leser antall punker
npunkt = fscanf(filid,'%i',[1 1]);


% LESER INN XY-KOORDINATER TIL KNUTEPUNKTENE
    % punkt: [x-koordinat, y-koordinat, grensebetingelse....
    % (1 => fast innspent, 0 => fri rotasjon)]
punkt = fscanf(filid,'%f %f %i',[3 npunkt])';


% Leser antall elementer 
nelem = fscanf(filid,'%i',[1 1]);


% Leser konnektivitet:
    % [elementNummer, Knutpunkt ende 1, knutepunkt ende 2, E-modul, ....
    % tversnittstype (1 = I-profil, 2 = Rør-profil)]  
elem = fscanf(filid,'%i %i %f %i',[4 nelem])';

fprintf('Noder og elementer lest inn\n')

%% Tversnitt
% Leser antall tversnitt
nTver = fscanf(filid, '%i', [1 1]);

% Leser informasjon om tversnittene i [mm]
    % 1 => I-profil:    [profilnummer,høyde, bredde bunnflens, bredde ....
    %                   toppflens, tykkelse stag, tykkelse bunnflens, ....
    %                   tykkelse toppflens] 
    % 2 => rørtvernitt: [profilnummer, ytrediameter, tykkelse, 0, 0, 0, 0]
profil = fscanf(filid,'%i %f %f %f %f %f %f',[7 nTver])';
fprintf('Tversnittsdata lest inn\n')
    
%% Laster
% Leser antall laster 
nlast = fscanf(filid,'%i',[1 1]);


% Leser lastdata
    % last: [lasttype (1 => jevnt fordelt,2 => punktlast, 3 => ytre moment, 
    %       ]
last = fscanf(filid,'%i %f %f %f',[4 nlast])';

fprintf('Lastdata lest inn\n')

% LUKKER INPUT-FILEN
fclose(filid);

% Tilbake melding til brukeren
fprintf('All informasjon lastet inn\n\n')
end
