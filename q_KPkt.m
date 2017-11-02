function q0_KPkt = q_KPkt(nelem, elem, l, nFlast, Flast,npunkt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    q_elem                                                        %
% Funksjon: Regner inn amplitudene i knutepunkt 1 og 2 for tilfellene der %
%           vi har jevnt fordelt last over et eller flere elementer       %
% Oppdatert: 2017-11-01                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Beregner last i knutepunktene når vi har jevnt fordelt last...\n')

q0_KPkt = zeros(nelem,2);               % Initialiserer
elemNum = Flast((1:nFlast),(4:7));      % Elementene det virker laster på 
l_last  = zeros(nFlast,1);

%% Utregning
 for i = 1:nFlast               % Looper over det totale antallet laster
    l_elem  = 0;                % Initaliserer lengden av ett element
    l_tot   = 0;                % Initaliserer totallengden
    antall_elem = Flast(i,1);   % Antall fordelte laster
    
    for j = 1:antall_elem       % Looper over antall elementer lasten går over
        element = Flast(i,j+3);   % Elementnummeret 
        l_elem  = l(element);   % Lengden av elementet
        l_tot   = l_tot + l_elem;   % Den totale lengden lasten går over
    end
    
    q0 = Flast(i,2);         % Amplitude hovedende 1
    q1 = Flast(i,3);         % Amplitude hovedende 2
    s = (q1-q0)/l_tot;       % Stigningstall
    q_a =  q0;               % 1.hovedende = 1.knutepunkt

    for h = 1:antall_elem           % Looper over antall elementer lasten går over
        element = Flast(i,h+3);     % Elementnummeret
        l_elem  = l(element);       %l_elem + l(element);   % Lengden av elementet
        q_b = q_a + s*l_elem;       % Beregner amplituden i "motsatt" ende
        q0_KPkt(element,1) = q_a;   % Tilordner til hovedmatrisa
        q0_KPkt(element,2) = q_b;   % Tilordner til hovedmatrisa

        q_a = q_b;                % Oppdaterer før neste element

    end
 end

fprintf('Laster i knutepunktene beregnet\n')
end