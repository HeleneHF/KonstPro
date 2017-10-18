function [elemStiv] = elemStivhet(nelem,elem,l,I)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    bjelkeStiv                                                    %
% Funksjon: Beregner bjelkestivheten EI/l for alle elementene             %                                          %
% Oppdatert: 2017-10-18                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
E = elem(:,3); % E-modul 

for i = 1: nelem
    if(elem(i,4) == 1) % I-Profil
        elemStiv(i) = E(i)*I(1)*(1/l(i)); 
    
    elseif (elem(i,4) == 2) % Rør-Profil
        elemStiv(i) = E(i)*I(2)*(1/l(i));
        
    else
        fprintf('Error\n')
    end
end

end

