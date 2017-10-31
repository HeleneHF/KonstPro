function b = lastvektor(fim,ytreMom,npunkt,punkt,nelem,elem)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    Lastvektor                                                    %
% Funksjon: Setter sammen lastvektoren                                    %
% Oppdatert: 2017-10-17                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Beregner lastvektoren...\n')

b = zeros(npunkt,1);                        

% Fra fordelte laster og punktlaster
for i = 1:nelem
    kPkt1 = elem(i,1);                      % Knutepunkt 1 for elementet
    kPkt2 = elem(i,2);                      % Knutepunkt 2 for elementet
    
    b(kPkt1,1) = b(kPkt1,1) - fim(i,1);     % "Summerer" laster i kPkt 1
    b(kPkt2,1) = b(kPkt2,1) - fim(i,2);     % "Summerer" laster i kPkt 2
end 

% Fra ytre momenter
b = b + ytreMom;        % Legger til de ytre momentene i tilhørende punkt 

fprintf('Lastvektor beregnet.\n')           % Melding til brukeren

end

