function [Kn, Bn] = bc(npunkt,punkt,K,b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    Bc                                                            %
% Funksjon: Boundry condition + noe smart                                 %
% Oppdatert: 2017-11-02                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Inkluderer grensebetingelser...\n')      % Melding til bruker

Kn = K;     % Initialiserer stivhetsmatrise inkludert rammebetingelser [Nmm]
Bn = b;     % Initialiserer lastvektor inkludert rammebetingelser [Nmm]


for i = 1:npunkt
    bc = punkt(i,3); 
    
    if bc == 1      % Fast innspent
        Kn(:,i) = 0;    % Nuller ut rad
        Kn(i,:) = 0;    % Nuller ut kolonne
        Kn(i,i) = 1;    % Setter inn slik at det blir med NB! SETT INN MER FORNUFTIG FORKLARING [Nmm]
        
        Bn(i) = 0; % Nuller ut i lastvektoren
        
    elseif (bc == 1) && (bc == 0) % Test for feil 
        fprintf('Error! Verdien tilsvarer ikke en definert bc!\n')  
        
    end
end

fprintf('Grensebetingelser tatt hensyn til.\n\n') % Melding til bruker
end

