function q0_KPkt = q0_KPktFunc(nelem, elem, l, nForL, ForL,npunkt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    q_elem                                                        %
% Funksjon: Regner inn amplitudene i knutepunkt 1 og 2 for tilfellene der %
%           vi har jevnt fordelt last over et eller flere elementer       %
% Oppdatert: 2017-11-04                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

q0_KPkt = zeros(nelem,2);       % Amplitudene i hvert knutepunkt

%% Utregning
 for i = 1:nForL               
    L_tot   = 0;                % totale lengden lasten går over
    n_elem = ForL(i,1);         % Antall elementer lasten går over 
    
    for j = 1:n_elem             
        element = ForL(i,j+3);   % Elementnummeret 
        L  = l(element);         % Lengden av elementet
        L_tot   = L_tot + L;     % Oppdaterer total lengde 
    end
    
    q1 = ForL(i,2);             % Amplitude hovedende 1 
    q2 = ForL(i,3);             % Amplitude hovedende 2 
    s = (q2-q1)/L_tot;          % Stigningstall 
    q_a =  q1;                  % 1.hovedende = 1.knutepunkt

    for h = 1:n_elem           
        element = ForL(i,h+3);      % Elementnummeret
        L  = l(element);            % Lengden av elementet
        q_b = q_a + s*L;            % Beregner amplituden i "motsatt" ende
        q0_KPkt(element,1) = q_a;   % Tilordner til hovedmatrisa
        q0_KPkt(element,2) = q_b;   % Tilordner til hovedmatrisa
 
        q_a = q_b;                  % Oppdaterer

    end
 end

fprintf('Laster i knutepunktene beregnet\n')
end