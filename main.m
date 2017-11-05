%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    MATLAB-Prosjektet                                             %
% Emne:     TMR4167 - Marin Teknikk 2                                     %                                                  
% Semester: H�st 2017                                                     %
% Forfattere:                                                             %                                                         
% Oppdatert: 2017-11-04                                                   %
% Funksjon: Main analyserer en konstruksjon med gitte profiler og laster  %
%           ved hjelp av en rekke underfunksjoner. Den skriver ut         %
%           rotasjonene i knutepunktene og endemomentene i knutepunktene  %
%           til konstruksjonen.                                           %
% Subrutiner:                                                             %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; format shorteng; 

%% ---------- 1. Initialiserer --------------------------------------------
fprintf('--------------------------------------------------------------\n')
fprintf('\t\t\t\t\t\t MATLAB-Prosjektet\n');    
fprintf('--------------------------------------------------------------\n')

[npunkt, punkt, nelem, elem, nTver, profil, nForL, ForL, nPktL, PktL, ....
nMom, Mom] = lesinput();    % Leser inputdata

%% ---------- 2. BEREGNINGER ELEMENTER OG PROFILER ------------------------
I  = I_areal(nTver,profil);         % 2. Arealmoment for profiltypene 
l = lengder(punkt,elem,nelem);      % Elementlengder
EI_l = elemStivhet(nelem,elem,l,I); % Elementenes b�yestivhet

%% ---------- 3. BEREGNINGER LASTER ---------------------------------------
q0_KPkt = q0_KPktFunc(nelem,elem, l, nForL, ForL, npunkt);        
            
%% ---------- 4. FASTINNSPENNINGSMOMENTER ---------------------------------
fim = moment(npunkt,punkt,nelem,elem,l, nPktL, PktL,nForL, ....
                        ForL,nMom,Mom,q0_KPkt); 
                    
ytreMom = ytreMomFunc(npunkt,nMom, Mom);

%% ---------- 5. LASTVEKTOR OG SYSTEMSTIVHETSMATRISE ----------------------
b = lastvektor(fim,ytreMom,npunkt,nelem,elem);  % Lastvektoren    
K = stivhet(nelem,elem,npunkt,EI_l);            % Systemstivhetsmatrisen
 
%% ---------- 6. L�SER LIGNINGSSYSTEMET -----------------------------------
[Kn, Bn] = bc(npunkt,punkt,K,b);    % Innf�rer grensebetingelser
rot = Kn\Bn;                        % Beregner rotasjonene

%% ---------- 7. ENDEMOMENTER ---------------------------------------------
% NB: FEIL!!
    endeMom = endeM(npunkt,punkt,nelem,elem,rot,fim,EI_l);   
    %endeMom = [-58.2077e-9, -58.2077e-9; ....
    %              -810.000e6, 0];  %NB! MARI SINE FOR � HA NOE � TESTE P� 

%% ---------- 8. B�YEMOMENTER ---------------------------------------------
BoyPktL = BoyPktL(nelem,elem,l,nPktL, PktL,fim);  % Fra punktlaster
BoyForL = BoyForL(nelem,l,q0_KPkt,fim);           % Fra fordelte laster
midtMom = BoyPktL + BoyForL;                      % Approksimert totalt  

%% ----------  9. SPENNINGER ---------------------------------------------- 
%v = sjaer(nelem, elem,l,endeMom,nPktL,PktL,nForL,ForL,q0_KPkt);
sigma = spenning(profil,nelem,elem,I,endeMom,midtMom); 
testSigma = spenningstest(sigma);                      

%% ---------- 10. RESULTATER ----------------------------------------------
% disp('Rotasjonane i de ulike punktene:')
% rot

%disp('Elementvis endemoment:')
%endemoment
