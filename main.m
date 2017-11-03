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

[I,y_global]  = I_areal(nTver,profil);  % 2. Arealmoment og globalt arealsenter for profiltypene [[mm^4],[mm]]

l = lengder(punkt,elem,nelem);          % Elementlengder [mm]

elemStiv = elemStivhet(nelem,elem,l,I); % Elementenes bøyestivhet [Nmm] ??????

%% ------------ 3. Beregninger for lastene --------------------------------

q0_KPkt = q_KPkt(nelem,elem, l, nFlast, ....  % Amplitudene i knutepunktene
                Flast, npunkt);               % ([kN/m] =  [N/mm])
             
%% ----------- 4. Fastinnspenningsmomentene -------------------------------

[fim,ytreMom] = moment(npunkt,punkt,nelem,elem,l, nPktL, PktL,nFlast, ....
                        Flast,nMom,Mom,q0_KPkt); % [Nmm]

%% ----------- 5. Setter opp lastvektor b ---------------------------------

b = lastvektor(fim,ytreMom,npunkt,nelem,elem);   % [Nmm]

%% ----------- 6. Setter opp systemstivhetsmatrisen K ---------------------

K = stivhet(nelem,elem,npunkt,elemStiv);  % [Nmm]          

%% ------------ 7. Innfører randbetingelser -------------------------------

[Kn, Bn] = bc(npunkt,punkt,K,b); % [Nmm]
     
%% ------------ 8. Løser ligningssytemet ----------------------------------

rot = Kn\Bn; % [-]

%% ------------ 9. Finner endemoment for hvert element --------------------

endemoment = endeM(npunkt,punkt,nelem,elem,rot,fim,elemStiv);   % NB: FEIL!!
endemoment = [-58.2977e-9, -58.2977e-9; ....
              -810.000e3, 0];                                   %NB! MARI SINE FOR Å HA NOE Å TESTE PÅ 
          
%% ------------ 10. Bøyemoment i endene pga. punktlast --------------------
          

%% ------------ 11. Bøyemoment under lasten pga. punktlast ----------------

BoyPktL = BoyPgaPktL(nelem,elem,l,nPktL, PktL,fim);  


%% ------------ 13. Bøyemoment midt på bjelken pga. fordelt last ----------


  %% ----------- 10. Skriver ut rotasjonene ---------------------------------

% disp('Rotasjonane i de ulike punktene:')
% rot

%% ---------- 11. Skriver ut momentene  -----------------------------------

%disp('Elementvis endemoment:')
%endemoment