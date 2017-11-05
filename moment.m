function fim = moment(npunkt,punkt,nelem,elem,l, nPktL, PktL,nFlast,....
                Flast,nMom,Mom,q0_KPkt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    Moment                                                        %
% Funksjon: Beregner fastinnspenningsmomentene i enden av hvert element   %
%           pga. punktlast og fordelte laster. Dersom vi har en trapes-   %
%           last deles den opp i to bidrag. Et som en jevnt fordelt last  %
%           og en som en trekantlast som superposisjoneres.               %
% Oppdatert: 2017-11-04                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fim = zeros(nelem,2);   % Fastinnspenningsmomentene  

% ----------------------- Punktlast [N] -----------------------------------

for i = 1:nPktL
    element = PktL(i,1);        % Elementnummeret
    P = PktL(i,2);              % Lastamplituden 
    alpha = PktL(i,3);          % Avstand (0-1) på lasten fra ende a 
    L = l(element);             % Elementlengden
    
    a = l(element)*alpha;       % Avstand fra last til ende a 
    b = l(element) - a;         % Avstand fra last til ende b 
    m_ab = -P*(a*b^2/L^2);      % Momentet i ende a pga. lasten 
    m_ba = P*(a^2*b/L^2);       % Momentet i ende b pga. lasten 
    
    fim(element,1) = fim(element,1) + m_ab; % Fastinnspenningsmoment i a 
    fim(element,2) = fim(element,2) + m_ba; % Fastinnspenningsmoment i a
end

% ----------------------- Fordelt last ([kN/m] = [N/mm]) ------------------
for j = 1:nelem
   q_a = q0_KPkt(j,1) ;     % Lastamplituden ende 1
   q_b = q0_KPkt(j,2);      % Lastamplituden ende 1
   L = l(j);                % Elementlengden
  
   if q_a == q_b                % Jevnt fordelt last
    m_ab = -(1/12)*q_a*L^2;     % Bidrag i ende 1 og ende 2. Like store
    m_ba = (1/12)*q_b*L^2;      
   
   
   else                         % Trapeslast
    m_ab_jf = -(1/12)*q_a*L^2;  % Bidrag ende 1 jevnt fordelt last
    m_ba_jf = (1/12)*q_b*L^2;   % Bidrag ende 2 jevnt fordelt last
        
        
        if q_b > q_a            % Tester hvilen ende som er størst
            
            q_c = q_b - q_a;    % Amplitude trekantlast, ende b størst 
            m_ab_trapes = -(1/30)*q_c*L^2;  % Bidrag ende 1 trekantlast
            m_ba_trapes = (1/20)*q_c*L^2;   % Bidrag ende 2 trekantlast

        else
            q_c = q_a - q_b;    % Amplitude trekantlast, ende a størst 
            m_ab_trapes = -(1/20)*q_c*L^2;  % Bidrag ende 1 trekantlast
            m_ba_trapes = (1/30)*q_c*L^2;   % Bidrag ende 2 trekantlast
        end
        
   m_ab = m_ab_jf + m_ab_trapes;    % Superposisjonerer i ende 1
   m_ba = m_ba_jf + m_ba_trapes;    % Superposisjonerer i ende 2   
   end
   
   fim(j,1) = fim(j,1) + m_ab; % Total fastinnspenningsmoment i a 
   fim(j,2) = fim(j,2) + m_ba; % Totalt fastinnspenningsmoment i b
end


fprintf('Fastinnspenningsmomentene beregnet\n'); 
end

