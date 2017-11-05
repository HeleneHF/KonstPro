function ytreMom = ytreMomFunc(npunkt,nMom, Mom)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    ytreMomFunc                                                   %
% Funksjon: Lager en matrise med plass til momentene som virker i hvert   %
%           knutepunkt, tar inn de påsatte momentene og organiserer dem   %
%           til riktig knutepunkt                                         %
% Oppdatert: 2017-11-04                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ytreMom = zeros(npunkt,1);      

for i = 1:nMom
    KPkt = Mom(i,1);    % Knutepunktet momentet virker på 
    M = Mom(i,2);       % Størrelsen på momentet 

    ytreMom(KPkt) = M;   % Tilordner til tilhørende knutepunkt
 end

end

