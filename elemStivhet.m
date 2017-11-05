function EI_L = elemStivhet(nelem,elem,l,I)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    bjelkeStiv                                                    %
% Funksjon: Beregner bjelkestivheten EI/l for alle elementene             %                                          %
% Oppdatert: 2017-10-18                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

E = elem(:,3);          % E-modul 
EI_L = zeros(nelem,1);  % Bjelkestivhetene                    

for i = 1: nelem
% ------------------------ I-Profil ---------------------------------------
    if(elem(i,4) == 1)     
        EI_L(i) = E(i)*I(1)*(1/l(i));     

% ------------------------ Rør-Profil -------------------------------------
    elseif (elem(i,4) == 2)
        EI_L(i) = E(i)*I(2)*(1/l(i))';  

 % ----------------------- Ukjent profil ----------------------------------     
     else
        fprintf('Error\n')
        EI_L(i) = 0;                   
    end
end

fprintf('Elementstivheter beregnet\n');   
end