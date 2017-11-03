function [elemStiv] = elemStivhet(nelem,elem,l,I)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    bjelkeStiv                                                    %
% Funksjon: Beregner bjelkestivheten EI/l for alle elementene             %                                          %
% Oppdatert: 2017-10-18                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Elementstivhetene beregnes...\n');  % Melding til bruker
    
E = elem(:,3);                              % E-modul ([MPa] = [N/mm^2])
elemStiv = zeros(nelem,1);                  % Initialiserer elemStiv

for i = 1: nelem
    if(elem(i,4) == 1)                      
        elemStiv(i) = E(i)*I(1)*(1/l(i));   % I-Profil [Nmm]
    
    elseif (elem(i,4) == 2) 
        elemStiv(i) = E(i)*I(2)*(1/l(i))';  % Rør-Profil [Nmm]
        
    else
        fprintf('Error\n')
        elemStiv(i) = 0;                    % Ukjent profil 
    end
end

fprintf('Elementstivheter beregnet\n\n');   % Melding til bruker
end