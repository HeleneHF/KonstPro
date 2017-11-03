function b = lastvektor(fim, moment_ytre, nelem, npunkt, elem)

b = zeros(npunkt,1);

for i = 1:nelem
    
    %Henter knutepunktsnummer for aktuelt element
    punkt1 = elem(i,1);
    punkt2 = elem(i,2);
    
    %Henter fastinnspenningsmoment gjor om til fastholdingsmomenter 
    %(fortegn), og setter i lastvektor
    %a = fim(i,1)
    %c = fim(i,2)
    b(punkt1,1) = b(punkt1,1) - fim(i,1);
    b(punkt2,1) = b(punkt2,1) - fim(i,2);

end
b =  b + moment_ytre;
end