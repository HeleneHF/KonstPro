function elemLengde = lengder(knutepunkt,elem,nelem)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    lengder                                                       %
% Funksjon: Regner ut lengden på hver at elementene i konstruksjonen på   %
%           bakgrunn av knutepuntskoordinatene. Finner endring i x- og y- %
%           retning separat og bestemmer den totale lengden med pytagoras %
% Oppdatert: 2017-10-17                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Beregner elementlengder...\n') % Melding til bruker

elemLengde = zeros(nelem,1);            % Initialiserer vektor med lengder

for i=1:nelem
   dx = knutepunkt(elem(i,1),1) - knutepunkt(elem(i,2),1);  % Diff. i x
   dy = knutepunkt(elem(i,1),2) - knutepunkt(elem(i,2),2);  % Diff i y
   elemLengde(i) = sqrt(dx*dx + dy*dy);                     % Elementlengde
end
 
fprintf('Elementlengder regnet ut\n\n'); % Melding til bruker    

end

