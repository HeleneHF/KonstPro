function b = lastvektor(fim,ytreMom,npunkt,nelem,elem)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    Lastvektor                                                    %
% Funksjon: Setter sammen lastvektoren. Tar inn fastinnspenningsmomentene %
%           og de ytre momentene. Omgjør slik at vi har informasjon om    %
%           hver node i stede for hver ende av et element. Sørger for     %
%           riktig fortegn.                                               % 
% Oppdatert: 2017-11-03                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

b = zeros(npunkt,1);    % Lastvektoren

% ----------------- Fra fordelte laster og punktlaster --------------------
for i = 1:nelem
    KPkt1 = elem(i,1);                      % Knutepunkt 1 for elementet
    KPkt2 = elem(i,2);                      % Knutepunkt 2 for elementet 

    b(KPkt1,1) = b(KPkt1,1) - fim(i,1);     % Laster i kPkt 1
    b(KPkt2,1) = b(KPkt2,1) - fim(i,2);     % Laster i kPkt 2
end 

% ----------------- Fra ytre momenter -------------------------------------
b = b + ytreMom;        % Legger til ytre momenter 

fprintf('Lastvektor beregnet.\n')          
end

