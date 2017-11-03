function S = endeM(npunkt,punkt,nelem,elem,rot,fim,elemStiv)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    Endemoment                                                    %
% Funksjon:                                                               %
% Oppdatert: 2017-11-02                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Regner ut endemomenter...\n'); % Melding til bruker

S = zeros(nelem,2); 

const = [4 2 ; 2 4]; 

for i = 1:nelem
    KPkt1 = elem(i,1); 
    KPkt2 = elem(i,2); 
   
    k_i = const*elemStiv(i); % [Nmm]
    
    v_i = [rot(KPkt1); rot(KPkt2)]; % [-]
    S_i_bar = [fim(i,1); fim(i,2)]; % [Nmm]
    
     S_i = k_i*v_i + S_i_bar; % [Nmm]
     S(i,1:2) = S_i;          % [Nmm]  
     
end
fprintf('Endemomenter regnet ut.\n'); % Melding til bruker

end

