function [elemlengder] = lengder(punkt,elem,nelem)
%{ 
LENGDER: Denne funksjonen finner lengden på elementene basert på 
koordinatene til knutepunktene
Lengdene er gitt i [m]
%}

elemlengder = zeros(nelem,1);

% Beregner elementlengder
for i=1:nelem
   dx = punkt(elem(i,1),1) - punkt(elem(i,2),1);
   dy = punkt(elem(i,1),2) - punkt(elem(i,2),2);
   % Beregner total elementlengde i [m]
   elemlengder(i) = (sqrt(dx*dx + dy*dy));
end

end
