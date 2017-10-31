function [I_elem] = annet_arealmoment(nelem, elem, profil,nprofil )
%{
ANNNET_AREALMOMENT:  Finner annet arealmoment for elementdelen, hvis den er
boks-profil eller r�r-profil
Tallene som hentes fra inputfilen vil v�re i meter
OUTPUT: Vektor med et tall per element nedover
%}

% Danner en matrise i �nsket st�rrelse
I_elem = zeros(nelem,1);   

% Sjekker antall profiler og finner ut om det er boks eller r�r.
for i = 1:nprofil 
    if profil(i,1) == 1     % Hvis boks-profil
        Iindre = ((profil(i,2))^3) * profil(i,4) * (1/12);  % Regner ut det annet arealmoment for indre dimensjoner
        Iytre = profil(i,5) * ((profil(i,3))^3) * (1/12);   % Regner ut for ytre
        I_boks = Iytre - Iindre;    % Finner total I ved � ta ytre I minus indre I
        
        for j=1:nelem           % G�r gjennom alle elementene
            if elem(j,4) == 1   % Sjekker om elementet har boksprofil
          I_elem(j) = I_boks;   % Hvis det har det setter I til det for boks
            end
        end
        
% Hvis ikke boks-profil, s� r�rprofil        
    else    % Regner annet arealmoment for r�rprofil(da vi bare har to typer profil)
        
        Dytre = profil(i,2);                % Finner ytre diameter
        Dindre = Dytre-2*profil(i,3);       % Finner indre diameter
        I_ror = ( pi/64)*(Dytre^4-Dindre^4);% Regner ut I i henhold til formel
        
      for j=1:nelem         % G�r gjennom alle elementene
      if elem(j,4) == 2     % Sjekker om elementet har r�rprofil
         I_elem(j) = I_ror; % Setter i s� fall inn I for r�r p� rett sted
      end
      end
      
    end
end          
    
end

