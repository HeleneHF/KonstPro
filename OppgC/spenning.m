 function sigma = spenning(profil,nelem,elem,I,endeMom,m_midt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    spenning                                                      %
% Funksjon: Lager en matrise med plass til momentene som virker i hvert   %
%           knutepunkt, tar inn de påsatte momentene og organiserer dem   %
%           til riktig knutepunkt                                         %
% Oppdatert: 2017-11-04                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sigma = zeros(nelem,3);     % Spenningene

for i = 1:nelem
    profilType = elem(i,4); % Avgjør profiltypen
    M1 = endeMom(i,1);      % Endemoment ende 1
    M2 = endeMom(i,2);      % Endemoment ende 2  
    M3 = m_midt(i,1);       % Midtmoment 
        
% ------------------------- I-PROFIL --------------------------------------
    if profilType == 1     
        y_I = 0.5*profil(1,2);          % Profilets arealsenter
        sigma(i,1) = (M1*y_I)/I(1);     % Spenning ende 1
        sigma(i,2) = (M2*y_I)/I(1);     % Spenning ende 1
        sigma(i,3) = (M3*y_I)/I(1);     % Spenning på midten av bjelken

% ------------------------- RØRTVERSNITT ----------------------------------
    elseif profilType == 2 
        y_ror = 0.5*profil(2,2);        % Profilets arealsenter
        sigma(i,1) = (M1*y_ror)/I(2);   % Spenning ende 1
        sigma(i,2) = (M2*y_ror)/I(2);   % Spenning ende 1
        sigma(i,3) = (M3*y_ror)/I(2);   % Spenning på midten av bjelken
        
% ------------------------- ANNET -----------------------------------------    
    else
        fprintf('Error: Ugyldig profil! Kun definert I- og rør-profil')
    end
    
end

end

