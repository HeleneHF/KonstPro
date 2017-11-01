function K = stivhet(nelem,elem,npunkt,elemStiv)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    Stivhet                                                       %
% Funksjon:                                                               %
% Oppdatert: 2017-10-31                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Beregner elementene i systemstivhetsmatrisen...\n') % Til bruker

K = zeros(npunkt);          % Oppretter systemstivhetsmatrisa
const = [4 2; 4 2];         % 

for i=1:nelem
    % Lokalt 
    ende1 = elem(i,1);      % Knutepunkt ende 1
    ende2 = elem(i,2);      % Knutepunkt ende 2
    
    k = const*elemStiv(i);  % Elementstivhetsmatrisa
    
    % Globalt
    K(ende1,ende2) = K(ende1,ende2) + k(1,1); 
    K(ende1,ende2) = K(ende1,ende2) + k(1,2);
    K(ende2,ende1) = K(ende1,ende2) + k(2,1); 
    K(ende2,ende2) = K(ende1,ende2) + k(2,1); 
end

fprintf('Systemstivhetsmatrise definert\n\n')   % Melding til bruker
end

