%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    MATLAB-Prosjektet                                             %
% Emne:     TMR4167 - Marin Teknikk 2                                     %                                                  
% Semester: H�st 2017                                                     %
% Forfattere:                                                             %                                                         
% Oppdatert: 2017-10-17                                                   %
% Funksjon: Main analyserer en konstruksjon med gitte profiler og laster  %
%           ved hjelp av en rekke underfunksjoner. Den skriver ut         %
%           rotasjonene i knutepunktene og endemomentene i knutepunktene  %
%           til konstruksjonen.                                           %
% Subrutiner:                                                             %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Sletter alle gammle variabler
clear all

%% ----------- 1. Definerer globale variable ------------------------------

DefParametere   % Definert i separat .m fil 
                % NB! 1 i stede for kandidatnummere!!!
 
%% ----------- 2. Leser input-data ----------------------------------------

[npunkt,knutepunkt,nelem,elem,nlast,last] = lesinput();


%% ----------- 3. Regner lengder til elementene ---------------------------

elementlengder = lengder(knutepunkt,elem,nelem);


%% ----------- 4. Fastinnspenningsmomentene -------------------------------

% Lag funksjon selv
%fastImoment = moment(npunkt,punkt,nelem,elem,nlast,last,elementlengder);


%% ----------- 5. Setter opp lastvektor -----------------------------------

% Lag funksjon selv
%b = lastvektor(fim,npunkt,punkt,nelem,elem);


%% ----------- 6. Setter opp systemstivhetsmatrisen -----------------------

% Lag funksjon selv
%K = stivhet(nelem,elem,elementlengder,npunkt);


%% ------------ 7. Innf�rer randbetingelser -------------------------------

% Lag funksjon selv
%[Kn, Bn] = bc(npunkt,punkt,K,b);
     

%% ------------ 8. L�ser ligningssytemet ----------------------------------

% Lag funksjon selv
%rot = Kn\Bn;


%% ------------ 9. Finner endemoment for hvert element --------------------

% Lag funksjon selv
% endemoment = endeM(npunkt,punkt,nelem,elem,elementlengder,rot,fim);


%% ----------- 10. Skriver ut rotasjonene ---------------------------------

%disp('Rotasjonane i de ulike punkta:')
%rot

%% ---------- 11. Skriver ut momentene  -----------------------------------

%disp('Elementvis endemoment:')
%endemoment