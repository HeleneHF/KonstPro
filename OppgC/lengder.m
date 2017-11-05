function l = lengder(punkt,elem,nelem)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    lengder                                                       %
% Funksjon: Regner ut lengden på hver at elementene i konstruksjonen på   %
%           bakgrunn av knutepuntskoordinatene. Finner endring i x- og z- %
%           retning separat og bestemmer den totale lengden med pytagoras %
% Oppdatert: 2017-10-17                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

l = zeros(nelem,1);            % Initialiserer vektor med lengder

for i=1:nelem
   dx = punkt(elem(i,1),1) - punkt(elem(i,2),1);  % Endring i x
   dy = punkt(elem(i,1),2) - punkt(elem(i,2),2);  % Endring i y
   l(i) = sqrt(dx*dx + dy*dy);                    % Elementlengde
end
 
fprintf('Elementlengder regnet ut\n');    
end

