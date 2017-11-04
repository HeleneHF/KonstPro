function [npunkt, punkt, nelem, elem, nTver, profil, nFlast, Flast, nPktL,....
         PktL, nMom, Mom] = lesinput()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    lesinput                                                      %
%                                                                         %
% Funksjon: Leser inn n�dvending informasjon om konstruksjonen og lastene %
%           fra en forh�ndsdefinert inputfil med n�dvendig data.          %
%           tilh�rende lastene                                            %
%                                                                         %
% Oppdatert: 2017-11-01                                                   %
%                                                                         %
% Formater:                                                               %
%           punkt =     [x-koordinat [mm], y-koordinat [mm], grensebetingelse       %
%                       (1 => fast innspent, 0 => fri rotasjon)]          %
%                                                                         %
%           elem =      [Knutpunkt ende 1,                 %
%                       knutepunkt ende 2, E-modul [MPa],                 %
%                       tversnittstype (1 = I-profil, 2 = R�r-profil)]    %
%                                                                         %
%           profil(I) = [profilnummer,profilh�yde [mm], tykkelse bunnflens [mm],.. %
%                       tykkelse toppflens [mm], tykkelse stag [mm],  bredde ....    %
%                       bunnflens[mm],bredde toppflens[mm]]                       %
%                                                                         %
%           profil(r�r) = [profilnummer, ytrediameter[mm], tykkelse [mm], %
%                          0, 0, 0,0]                                     %
%                                                                         %
%           Flast =     [antall element lasten g�r over, amplitude f�rste %
%                       element ([kN/m] = [N/mm]), amplitude siste element ([kN/m] = [N/mm]),  %                             
%                       elementene lasten g�r over(maks 4)]               %
%                                                                         %
%           PktL =      [elementnummer,amplitude [N], avstand til KPkt 1 [mm]]     %
%                                                                         %
%           Mom =       [Knutepunkt, moment [Nmm]                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hoved = false;                          % Avgj�r om hoved- eller testfila
fprintf('\nStarter innlesning...\n');   % Melding til bruker

%% �pner inputfila
if (hoved)    
    filid = fopen('input.txt','r');             % �pner hovedoppgaven
    fprintf('Leser inn hovedoppgaven...\n');    % Melding til bruker
else 
    filid = fopen('TestInputC_2014.txt','r');   % �pner Oppgave c 2014
    fprintf('Leser inn oppgave c...\n');        % Melding til bruker
end

%% Knutepunkt og elementer
npunkt = fscanf(filid,'%i',[1 1]);               % Antall knutepunkt
punkt  = fscanf(filid,'%f %f %i',[3 npunkt])';   % Informasjon om punktene
    
nelem =  fscanf(filid,'%i',[1 1]);               % Antall elementer
elem  =  fscanf(filid,'%i %i %f %i',[4 nelem])'; % Info om elementene

fprintf('Noder og elementer lest inn\n')         % Melding til bruker

%% Tversnitt
nTver  = fscanf(filid, '%i', [1 1]);                % Antall tversnitt
profil = fscanf(filid,'%i %f %f %f %f %f %f',....   % Info om tversnittene
                [7 nTver])'; 

fprintf('Tversnittsdata lest inn\n')                % Melding til bruker
    
%% Laster
nFlast = fscanf(filid, '%i',[1 1]);          % Antall fordelte laster
Flast  = fscanf(filid, '%i %f %f %i %i %i %i', [7 nFlast])';   % Info om de fordelte lastene

nPktL =  fscanf(filid, '%i',[1 1]);          % Antall punktlaster
PktL  =  fscanf(filid, '%i %f %f', [3 nPktL])';    % Info om punktlastene

nMom  =  fscanf(filid, '%i',[1 1]);          % Antall ytre momenter
Mom   =  fscanf(filid, '%i %f', [3 nMom])';     % Informasjon om momentene

%% Avslutter
fclose(filid);                               % Lukker input-filen
fprintf('All informasjon lastet inn\n\n');   % Melding til bruker

end
