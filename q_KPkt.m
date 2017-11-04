function q0_KPkt = q_KPkt(nelem, elem, l, nFlast, Flast,npunkt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    q_elem                                                        %
% Funksjon: Regner inn amplitudene i knutepunkt 1 og 2 for tilfellene der %
%           vi har jevnt fordelt last over et eller flere elementer       %
% Oppdatert: 2017-11-04                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Beregner last i knutepunktene når vi har jevnt fordelt last...\n')

q0_KPkt = zeros(nelem,2);               % Initialiserer
elemNum = Flast((1:nFlast),(4:7));      % Elementene det virker laster på 
l_last  = zeros(nFlast,1);

%% Utregning
 for i = 1:nFlast               % Looper over det totale antallet laster
    l_elem  = 0;                % Initaliserer lengden av ett element [mm]
    l_tot   = 0;                % Initaliserer totallengden [mm]
    antall_elem = Flast(i,1);   % Antall fordelte laster
    
    for j = 1:antall_elem         % Looper over antall elementer lasten går over
        element = Flast(i,j+3);   % Elementnummeret 
        l_elem  = l(element);     % Lengden av elementet [mm]
        l_tot   = l_tot + l_elem;   % Den totale lengden lasten går over [mm]
    end
    
    q0 = Flast(i,2);         % Amplitude hovedende 1 ([kN/m] =  [N/mm])
    q1 = Flast(i,3);         % Amplitude hovedende 2 ([kN/m] =  [N/mm])
    s = (q1-q0)/l_tot;       % Stigningstall [N] 
    q_a =  q0;               % 1.hovedende = 1.knutepunkt ([kN/m] =  [N/mm]);

    for h = 1:antall_elem           % Looper over antall elementer lasten går over
        element = Flast(i,h+3);     % Elementnummeret
        l_elem  = l(element);       %l_elem + l(element);   % Lengden av elementet [mm]
        q_b = q_a + s*l_elem;       % Beregner amplituden i "motsatt" ende ([kN/m] =  [N/mm])
        q0_KPkt(element,1) = q_a;   % Tilordner til hovedmatrisa ([kN/m] =  [N/mm])
        q0_KPkt(element,2) = q_b;   % Tilordner til hovedmatrisa ([kN/m] =  [N/mm])
 
        q_a = q_b;                % Oppdaterer før neste element ([kN/m] =  [N/mm])

    end
 end

fprintf('Laster i knutepunktene beregnet\n')
end