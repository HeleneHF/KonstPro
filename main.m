%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title: MATLAB PROJECT                                                   %
% Course: TMR4167 - Marin Teknikk 2                                       %                                                  
% Time: FALL 2017                                                         %
% Authors:                                                                %                                                         
% Updated: 2017-10-14                                                     %
% Subroutines:                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Sletter alle variabler
clear all

%% ----------- 1. Definerer globale variable ------------------------------
DefParametere   % Definert i separat .m fil 
                % NB! 1 i stede for kandidatnummere!!!

%% ----------- 2. Leser input-data ----------------------------------------
[npunkt,punkt,nelem,elem,nlast,last] = lesinput();


%% ----------- 3. Regner lengder til elementene ---------------------------
%elementlengder=lengder(punkt,elem,nelem);


%% ----------- 4. Fastinnspenningsmomentene -------------------------------
% Lag funksjon selv
%fim=moment(npunkt,punkt,nelem,elem,nlast,last,elementlengder);


%% ----------- 5. Setter opp lastvektor -----------------------------------
% Lag funksjon selv
%b=lastvektor(fim,npunkt,punkt,nelem,elem);


%% ----------- 6. Setter opp systemstivhetsmatrisen -----------------------
% Lag funksjon selv
%K=stivhet(nelem,elem,elementlengder,npunkt);


%% ------------ 7. Innfører randbetingelser -------------------------------
% Lag funksjon selv
%[Kn,Bn] = bc(npunkt,punkt,K,b);
     

%% ------------ 8. Løser ligningssytemet ----------------------------------
% Lag funksjon selv
%rot = Kn\Bn;


%% ------------ 9. Finner endemoment for hvert element --------------------
% Lag funksjon selv
% endemoment=endeM(npunkt,punkt,nelem,elem,elementlengder,rot,fim);


%% ----------- 10. Skriver ut rotasjonene ---------------------------------
%disp('Rotasjonane i de ulike punkta:')
%rot

%% ---------- 11. Skriver ut momentene  -----------------------------------
%disp('Elementvis endemoment:')
%endemoment