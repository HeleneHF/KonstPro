% Titel:    MATLAB-Prosjektet                                             %
% Emne:     TMR4167 - Marin Teknikk 2                                     %                                                  
% Semester: Høst 2017                                                     %
% Forfattere:                                                             %                                                         
% Oppdatert: 2017-10-25                                                   %
% Funksjon: Main analyserer en konstruksjon med gitte profiler og laster  %
%           ved hjelp av en rekke underfunksjoner. Den skriver ut         %
%           rotasjonene i knutepunktene og endemomentene i knutepunktene  %
%           til konstruksjonen.                                           %
% Subrutiner:                                                             %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Sletter alle eldre variabler
clear all;

%% ------------- 1. Leser input-data --------------------------------------
[npunkt, punkt, nelem, elem, nTver, profil, nFlast, Flast, nPktL, PktL, ....
nMom, Mom] = lesinput();

%% ------------- 2. Beregninger elementer og profiler ---------------------    
I = I_areal(nTver,profil);              % 2. Arealmoment for profiltypene

l = lengder(punkt,elem,nelem);          % Elementlengder [m]
elemStiv = elemStivhet(nelem,elem,l,I); % Elementenes bøyestivhet []

%% ------------ 3. Beregninger for lastene --------------------------------
[q0_KPkt,stig] = q_KPkt(nelem,elem, l, nFlast, Flast, npunkt);      % Amplitudene i knutepunktene
% NB! FUNKER IKKE ATM

%% ----------- 4. Fastinnspenningsmomentene -------------------------------
% Lag funksjon selv
 fastImoment = moment(npunkt,punkt,nelem,elem,l, nPktL, PktL,nFlast,Flast,nMom,Mom);
% fastImoment = moment(npunkt,punkt,nelem,elem,nlast,last,elementlengder);


%% ----------- 5. Setter opp lastvektor -----------------------------------
% Lag funksjon selv
% b = lastvektor(fim,npunkt,punkt,nelem,elem);


%% ----------- 6. Setter opp systemstivhetsmatrisen -----------------------
K = stivhet(nelem,elem,npunkt,elemStiv); % Systemstivhetsmatrisen


%% ------------ 7. Innfører randbetingelser -------------------------------
% Lag funksjon selv
%[Kn, Bn] = bc(npunkt,punkt,K,b);
     

%% ------------ 8. Løser ligningssytemet ----------------------------------
% Lag funksjon selv
% rot = Kn*inv(Bn)                   (rot = Kn\Bn);


%% ------------ 9. Finner endemoment for hvert element --------------------
% Lag funksjon selv
% endemoment = endeM(npunkt,punkt,nelem,elem,elementlengder,rot,fim);


%% ----------- 10. Skriver ut rotasjonene ---------------------------------
%disp('Rotasjonane i de ulike punkta:')
%rot

%% ---------- 11. Skriver ut momentene  -----------------------------------

%disp('Elementvis endemoment:')
%endemoment