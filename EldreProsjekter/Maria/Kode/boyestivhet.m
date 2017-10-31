function [stivhet] = boyestivhet(nelem, lengder, elem, I_elem) 
%{
BOYESTIVHET: Regner ut b�yestivheten til elementene
OUTPUT: Vektor med et tall for b�yestivheten til hvert element nedover),
f.eks til element 4 lagret i rad 4.
%}

% Danner en matrise med nuller i rett st�rrelse
stivhet = zeros(nelem,1); 

for i = 1:nelem         % G�r gjennomm alle elementene
    E_elem = elem(i,3); % Finner elementets E-modul hentet fra inputfila i MPa
    I = I_elem(i);      % Finner annet arealmoment til elementet
    L = lengder(i);     % Henter ut lengden til elementet
    stivhet(i,1) = (E_elem*I)/L; % Regner ut b�yestivheten (og deler p� L 
    % fordi det er den verdien vi trenger og plasserer den p� rett sted)
   
end
end