%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    DefParametere                                                 %
% Funksjon: Initaliserer basisinformasjon om konstruksjonen og de         %
%           tilhørende lastene                                            %
% Oppdatert: 2017-10-17                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Tilbake melding til brukeren
fprintf('\n\nVellykket startup \nDefinerer parametere...\n')

% Laster i [kN]
P1 = 1; 
P2 = 60; 


% Høyde [m]
h = 12;     % Hva er du?? 

% Lengder [m]
L1 = 18; 
L2 = 20; 

% Fordelte laster [kN/m]
q1 = 10;
q2 = 1 ; 
q3 = 1 ; 
q4 = 12; 

% Momenter [kN/m]
M1 = 1; 

% Flytespenneing [MPa]
sigma_max = 320; 

% Tilbake melding til brukeren
fprintf('Globale parametere definert\n')