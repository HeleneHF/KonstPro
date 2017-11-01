function [fim, ytreMom] = moment(npunkt,punkt,nelem,elem,l, nPktL, PktL,nFlast,Flast,nMom,Mom)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    Moment                                                        %
% Funksjon: Beregner fastinnspenningsmomentene i enden av hvert element   %
%           pga. punktlast og fordelte laster. Oppretter en vektor av     %
%           ytre momenter i knutepunktet de virker i.                     %
% Oppdatert: 2017-10-31                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Beregner fastinnspenningsmomentene...\n'); % Melding til bruker

fim = zeros(nelem,2);           % Initialiserer fim 
ytreMom = zeros(npunkt,1);      % Initialiserer ytreMom 

% Punktlast
for i = 1:nPktL
    elemNumm = PktL(i,1);       % Elementnummeret
    P = PktL(i,2);              % Lastamplituden
    alpha = PktL(i,3);          % Avstand (0-1) på lasten fra ende a
    lelem = l(elemNumm);        % Elementets totale lengde
    
    a = l(elemNumm)*alpha;      % Avstand fra last til ende a
    b = l(elemNumm) - a;        % Avstand fra last til ende b
    m_a = -P*(a*b^2/lelem^2);   % Momentet i ende a pga. lasten
    m_b = P*(a^2*b/lelem^2);    % Momentet i ende b pga. lasten
    
    fim(elemNumm,1) = fim(elemNumm,1) + m_a; % Total i a
    fim(elemNumm,2) = fim(elemNumm,2) + m_b; % Totalt i b

end

% Fordelt last - MÅ FÅ FERDIG DEN ANDRE FØRST!!! 
    % for j = 1:nFlast
    %     
    % end

% Ytre momenter 
 for i = 1:nMom
    pkt = Mom(i,1);     % Knutepunktet momentet virker på 
    M = Mom(i,2);       % Størrelsen på momentet 
    
    ytreMom(pkt) = M;   % Verdi tilordet til tilhørende knutepunkt
 end

fprintf('Fastinnspenningsmomentene beregnet\n\n'); % Melding til bruker
end

