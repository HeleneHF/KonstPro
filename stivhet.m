function K = stivhet(nelem,elem,npunkt,EI_L)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    stivhet                                                       %
% Funksjon: Regner ut elementstivhetsmatrisa for hvert element og         %
%           plasserer verdiene riktig i den globale stivehetsmatrisa      %
% Oppdatert: 2017-11-02                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

K = zeros(npunkt);           
konst = [4 2; 2 4];         

for i=1:nelem
    KPkt1 = elem(i,1);      % Knutepunkt ende 1 
    KPkt2 = elem(i,2);      % Knutepunkt ende 2
    
    k = konst*EI_L(i);  % Lokal elementstivhetsmatrise
    
    % Tilordner i den globale stivhetsmatrisen 
    K(KPkt1,KPkt1) = K(KPkt1,KPkt1) + k(1,1); 
    K(KPkt2,KPkt1) = K(KPkt2,KPkt1) + k(2,1); 
    K(KPkt1,KPkt2) = K(KPkt1,KPkt2) + k(1,2); 
    K(KPkt2,KPkt2) = K(KPkt2,KPkt2) + k(2,2); 
end

fprintf('Systemstivhetsmatrise definert\n')   
end

