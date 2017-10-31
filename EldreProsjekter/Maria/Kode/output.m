
function output(rot,npunkt,endemoment,nelem)
%{
OUTPUT: En funksjon som gjør utskrifen av programmets resultater lettere
å lese. Skriver ut element/knutepunkt og nummmer i tillegg til de
korresponderende verdiene for moment og rotasjon
%}
    % Skriver ut rotasjonene knyttet til knutepunkt
    fprintf('\nRotasjoner for hvert knutepunkt:\n\n');
    for i=1:npunkt
        fprintf('Knutepunkt %i:\t\t%f\n',i,rot(i,1));
    end

    % Skriver ut endemomentetene for hvert element
    fprintf('\n\n\nEndemoment for hvert element (lokal ende 1 og lokal ende 2):\n\n');
    for j=1:nelem
       fprintf('Element %i:\t\t%f\t\t%f\n', j, endemoment(j,1), endemoment(j,2));
    end
end