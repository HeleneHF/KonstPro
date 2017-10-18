%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    MATLAB-Prosjektet                                             %
% Emne:     TMR4167 - Marin Teknikk 2                                     %                                                  
% Semester: Høst 2017                                                     %
% Forfattere:                                                             %                                                         
% Oppdatert: 2017-10-18                                                   %
% Funksjon: Main analyserer en konstruksjon med gitte profiler og laster  %
%           ved hjelp av en rekke underfunksjoner. Den skriver ut         %
%           rotasjonene i knutepunktene og endemomentene i knutepunktene  %
%           til konstruksjonen.                                           %
% Subrutiner:                                                             %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Sletter alle eldre variabler
clear all

%% ----------- 1. Definerer globale variable ------------------------------

DefParametere   % Definert i separat .m fil 
                % NB! 1 i stede for kandidatnummere!!!
                % TROR DETTE SKAL INN I INPUTFILA I STEDE!!!
 
%% ----------- 2. Leser input-data ----------------------------------------
[npunkt,knutepunkt,nelem,elem,nlast,last,nTver,profil] = lesinput();


%% ----------- 3. Regner ut bøyestivheten til elementene ------------------
l = lengder(knutepunkt,elem,nelem); % Elementlengder [m]
I = I_areal(nTver,profil);          % 2. Arealmoment for ulike profiltyper¨
elemStiv = elemStivhet(nelem,elem,l,I); % Elementenes bøyestivhet []

%% ----------- 4. Fastinnspenningsmomentene -------------------------------

% Lag funksjon selv
% fastImoment = moment(npunkt,punkt,nelem,elem,nlast,last,elementlengder);


%% ----------- 5. Setter opp lastvektor -----------------------------------

% Lag funksjon selv
% b = lastvektor(fim,npunkt,punkt,nelem,elem);


%% ----------- 6. Setter opp systemstivhetsmatrisen -----------------------
% Lag funksjon selv
%K = stivhet(nelem,elem,elementlengder,npunkt);


%% ------------ 7. Innfører randbetingelser -------------------------------

% Lag funksjon selv
%[Kn, Bn] = bc(npunkt,punkt,K,b);
     

%% ------------ 8. Løser ligningssytemet ----------------------------------

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