function ytreMom = ytreMomFunc(npunkt,nMom, Mom)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    ytreMomFunc                                                   %
% Funksjon: Lager en matrise med plass til momentene som virker i hvert   %
%           knutepunkt, tar inn de p�satte momentene og organiserer dem   %
%           til riktig knutepunkt                                         %
% Oppdatert: 2017-11-04                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ytreMom = zeros(npunkt,1);      

for i = 1:nMom
    KPkt = Mom(i,1);    % Knutepunktet momentet virker p� 
    M = Mom(i,2);       % St�rrelsen p� momentet 

    ytreMom(KPkt) = M;   % Tilordner til tilh�rende knutepunkt
 end

end

