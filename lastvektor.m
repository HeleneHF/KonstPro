function b = lastvektor(fim,ytreMom,npunkt,nelem,elem)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    Lastvektor                                                    %
% Funksjon: Setter sammen lastvektoren. Tar inn fastinnspenningsmomentene %
%           og de ytre momentene. Omgjør slik at vi har informasjon om    %
%           hver node i stede for hver ende av et element. Sørger for     %
%           riktig fortegn.                                               % 
% Oppdatert: 2017-11-03                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Beregner lastvektoren...\n')       % Melding til bruker

b = zeros(npunkt,1);                        % Setter av plass til verdiene [Nmm]

% Fra fordelte laster og punktlaster
for i = 1:nelem
    kPkt1 = elem(i,1);                      % Knutepunkt 1 for elementet
    kPkt2 = elem(i,2);                      % Knutepunkt 2 for elementet 

    b(kPkt1,1) = b(kPkt1,1) - fim(i,1);     % "Summerer" laster i kPkt 1 [Nmm]
    b(kPkt2,1) = b(kPkt2,1) - fim(i,2);     % "Summerer" laster i kPkt 2 [Nmm]
end 

% Fra ytre momenter
b = b + ytreMom;        % Legger til de ytre momentene i tilhørende punkt [Nmm]

fprintf('Lastvektor beregnet.\n\n')           % Melding til bruker
end

