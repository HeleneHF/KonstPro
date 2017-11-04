function [endemoment, moment_rotasjon] = endeM(nelem, elem,...
    bjelkestivhet, rot, fim)

endemoment = zeros(nelem,2);%Totale enemoment
moment_rotasjon = zeros(nelem,2);%Bjelkeendemoment skapt av rotasjon
    %Skal brukes i beregning av skjear kraft
 bjelkestivhet; 
for i = 1:nelem
    
    %Henter ut knutepunktnummer for element
    punkt1 = elem(i,1);
    punkt2 = elem(i,2);
    
    %Henter ut rotasjon
    vinkel1 = rot(punkt1);
    vinkel2 = rot(punkt2);
    
    %Beregner belkeendemoment fra rotasjoner
    bjelkestivhet(i)
    moment_rotasjon(i,:) = bjelkestivhet(i) *...
        [4 * vinkel1 + 2 * vinkel2, 2 * vinkel1 + 4 * vinkel2]
    %fim(i,:)
    %Bjelkeendemomentene fra rotasjoner settes i matrise, sammen med
    %fastinnspenningsmomentene
    endemoment(i,:) = fim(i,:) + moment_rotasjon(i,:);
end
end