function K = stivhet(nelem,elem,npunkt,elemStiv)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    Stivhet                                                       %
% Funksjon:                                                               %
% Oppdatert: 2017-11-02                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Beregner elementene i systemstivhetsmatrisen...\n') % Til bruker

K = zeros(npunkt);          % Oppretter systemstivhetsmatrisa
const = [4 2; 2 4];         % 

for i=1:nelem
    % Lokalt 
    KPkt1 = elem(i,1);      % Knutepunkt ende 1
    KPkt2 = elem(i,2);      % Knutepunkt ende 2
    
    k = const*elemStiv(i);  % Elementstivhetsmatrisa
    
    % Globalt
    K(KPkt1,KPkt1) = K(KPkt1,KPkt1) + k(1,1); 
    K(KPkt2,KPkt1) = K(KPkt2,KPkt1) + k(2,1);
    K(KPkt1,KPkt2) = K(KPkt1,KPkt2) + k(1,2); 
    K(KPkt2,KPkt2) = K(KPkt2,KPkt2) + k(2,2); 
end

fprintf('Systemstivhetsmatrise definert\n\n')   % Melding til bruker
end

