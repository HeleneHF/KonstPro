function [Kn, Bn] = bc(npunkt,punkt,K,b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    Bc                                                            %
% Funksjon: Boundry condition + noe smart                                 %
% Oppdatert: 2017-11-02                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Inkluderer grensebetingelser...\n')      % Melding til bruker
Kn = K;     % Initialiserer
Bn = b;     % Initialiserer


for i = 1:npunkt
    bc = punkt(i,3); 
    if bc == 1      % Fast innspent
        
    
    elseif (bc == 1) && (bc == 0) % Test for feil 
        fprintf('Error! Verdien tilsvarer ikke en definert bc!\n')  
        
        
    else            % Fri rotasjon
        
    end
end

fprintf('Grensebetingelser tatt hensyn til.\n\n') % Melding til bruker

end

