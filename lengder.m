function elemLengde = lengder(knutepunkt,elem,nelem)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    lengder                                                       %
% Funksjon: Regner ut lengden på hver at elementene i konstruksjonen på   %
%           bakgrunn av knutepuntskoordinatene                            %
%           tilhørende lastene                                            %
% Oppdatert: 2017-10-17                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Tilbake melding til brukeren
fprintf('Regner ut lengden på elementene...\n')

elemLengde = zeros(nelem,1);

% Beregner elementlengder
for i=1:nelem
   dx = knutepunkt(elem(i,1),1) - knutepunkt(elem(i,2),1);
   dy = knutepunkt(elem(i,1),2) - knutepunkt(elem(i,2),2);
   elemLengde(i) = sqrt(dx*dx + dy*dy);
end

% Tilbake melding til brukeren
fprintf('Elementlengder regnet ut\n')

end

