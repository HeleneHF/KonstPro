%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    MATLAB-Prosjektet                                             %
% Emne:     TMR4167 - Marin Teknikk 2                                     %                                                  
% Semester: Høst 2017                                                     %
% Forfattere:                                                             %                                                         
% Oppdatert: 2017-11-02                                                   %
% Funksjon: Main analyserer en konstruksjon med gitte profiler og laster  %
%           ved hjelp av en rekke underfunksjoner. Den skriver ut         %
%           rotasjonene i knutepunktene og endemomentene i knutepunktene  %
%           til konstruksjonen.                                           %
% Subrutiner:                                                             %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; % Sletter eldre variable
format shorteng; 

%% ------------- 1. Leser input-data --------------------------------------

[npunkt, punkt, nelem, elem, nTver, profil, nFlast, Flast, nPktL, PktL, ....
nMom, Mom] = lesinput();

%% ------------- 2. Beregninger elementer og profiler ---------------------   

[I,y_global]  = I_areal(nTver,profil);  % 2. Arealmoment og globalt arealsenter for profiltypene

l = lengder(punkt,elem,nelem);          % Elementlengder [m]

elemStiv = elemStivhet(nelem,elem,l,I); % Elementenes bøyestivhet []

%% ------------ 3. Beregninger for lastene --------------------------------

q0_KPkt = q_KPkt(nelem,elem, l, nFlast, ....  % Amplitudene i knutepunktene
                Flast, npunkt);    
             
%% ----------- 4. Fastinnspenningsmomentene -------------------------------

[fim,ytreMom] = moment(npunkt,punkt,nelem,elem,l, nPktL, PktL,nFlast, ....
                        Flast,nMom,Mom,q0_KPkt);

%% ----------- 5. Setter opp lastvektor b ---------------------------------

b = lastvektor(fim,ytreMom,npunkt,nelem,elem);   

%% ----------- 6. Setter opp systemstivhetsmatrisen K ---------------------

K = stivhet(nelem,elem,npunkt,elemStiv);            

%% ------------ 7. Innfører randbetingelser -------------------------------

[Kn, Bn] = bc(npunkt,punkt,K,b); 
     
%% ------------ 8. Løser ligningssytemet ----------------------------------

rot = Kn\Bn; 

%% ------------ 9. Finner endemoment for hvert element --------------------
% Lag funksjon selv

endemoment = endeM(npunkt,punkt,nelem,elem,rot,fim,elemStiv);


%% ----------- 10. Skriver ut rotasjonene ---------------------------------

% disp('Rotasjonane i de ulike punktene:')
% rot

%% ---------- 11. Skriver ut momentene  -----------------------------------

%disp('Elementvis endemoment:')
%endemoment