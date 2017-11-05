function [Kn, Bn] = bc(npunkt,punkt,K,b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    Bc                                                            %
% Funksjon: Oppdaterer systemstivhetsmatrisa og lastvektoren slik at de   %
%           tar hensyn til grensebetingelsene. I vårt tilfelle er noen av %
%           knutepunktene fast innspent og om de er det må vi "nulle ut"  %
%           tilhørende rad og kolonne slik at vi ikke får rotasjoner i    % 
%           de fast innspente punktene. Grensebetingelsene er lest inn    %
%           sammen med resten av informasjonen om knutepunktene og det er %
%           fast innspent dersom verdien er 1.                            %            
% Oppdatert: 2017-11-02                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Kn = K;     % Systemstivhetsmatrise inkludert grensebetingelser
Bn = b;     % Lastvektor inkludert grensebetingelser

for i = 1:npunkt
    bc = punkt(i,3);    % Gensebetingelse 
    
    if bc == 1          % Fast innspent
        Kn(:,i) = 0;    % Nuller ut rad
        Kn(i,:) = 0;    % Nuller ut kolonne
        Kn(i,i) = 1;    
        
        Bn(i) = 0; % Nuller ut i lastvektoren
        
    elseif (bc == 1) && (bc == 0) % Test for feil 
        fprintf('Error! Verdien tilsvarer ikke en definert bc!\n')  
        
    end
end

fprintf('Grensebetingelser tatt hensyn til.\n') 
end

