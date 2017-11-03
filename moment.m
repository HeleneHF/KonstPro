function [fim, ytreMom] = moment(npunkt,punkt,nelem,elem,l, nPktL, PktL,nFlast,Flast,nMom,Mom,q0_KPkt)
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

% Punktlast [N]
for i = 1:nPktL
    elemNumm = PktL(i,1);       % Elementnummeret
    P = PktL(i,2);              % Lastamplituden [N]
    alpha = PktL(i,3);          % Avstand (0-1) på lasten fra ende a [-]
    lelem = l(elemNumm);        % Elementets totale lengde [mm]
    
    a = l(elemNumm)*alpha;      % Avstand fra last til ende a [mm]
    b = l(elemNumm) - a;        % Avstand fra last til ende b [mm]
    m_a = -P*(a*b^2/lelem^2);   % Momentet i ende a pga. lasten [Nmm]
    m_b = P*(a^2*b/lelem^2);    % Momentet i ende b pga. lasten [Nmm]
    
    fim(elemNumm,1) = fim(elemNumm,1) + m_a; % Total i a  [Nmm]
    fim(elemNumm,2) = fim(elemNumm,2) + m_b; % Totalt i b [Nmm]

end

% Fordelt last ([kN/m] = [N/mm])
for j = 1:nelem
   q_a = q0_KPkt(j,1) ; % [N/mm]
   q_b = q0_KPkt(j,2);  % [N/mm]
   
   l_elem = l(j);       % [mm]
   
   m_ab_1 = -(1/20)*l_elem^2*q_a; % [Nmm]
   m_ba_1 =  (1/30)*l_elem^2*q_a; % [Nmm]
   
   m_ab_2 = -(1/30)*l_elem^2*q_b; % [Nmm]
   m_ba_2 =  (1/20)*l_elem^2*q_b; % [Nmm]
   
   
   m_ab = m_ab_1 + m_ab_2; % [Nmm]
   m_ba = m_ba_1 + m_ba_2; % [Nmm]
   
  fim(j,1) = fim(j,1) + m_ab; % Total i a % [Nmm]
  fim(j,2) = fim(j,2) + m_ba; % Totalt i b % [Nmm]

end

% Ytre momenter [Nmm]
 for k = 1:nMom
    pkt = Mom(k,1);     % Knutepunktet momentet virker på 
    M = Mom(k,2);       % Størrelsen på momentet [Nmm]
    
    ytreMom(pkt) = M;   % Verdi tilordet til tilhørende knutepunkt [Nmm]
 end

fprintf('Fastinnspenningsmomentene beregnet\n\n'); % Melding til bruker
end

