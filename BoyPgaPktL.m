function m_midt = BoyPgaPktL(nelem,elem,l,nPktL, PktL,fim); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    BoyPgaPktL                                                    %
% Funksjon:                                                               %
% Oppdatert: 2017-11-03                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m_midt = zeros(nelem,1); 

    for i = 1:nPktL
        element = PktL(i,1);    % Elementet lasten virker på  
        P = PktL(i,2);           % Lastamplituden [N]
        alpha = PktL(i,3);      % Avstandenskoeffisienten [-]

        l_elem  = l(i);         % Lengden av elementet lasten virker på [mm]
  
        
        a = l_elem*alpha;       % Avstand fra knutepunkt 1 til lasten
        b = l_elem - a;         % Avstand fra knutepunkt 2 til lasten

        m = -P*(a*b/l_elem);    % Moment på midten "når fritt opplagt"
        m_ende = (1/l_elem)*((-fim(i,1)*b)+(fim(i,2)*a)); % Momentet på midten pga. fastinnspenningsmomentene. 
        
        m_midt(element,1) = m_midt(i,1) + m + m_ende;  % Det totale momentet på midten pga punktlasten 
    end
end

