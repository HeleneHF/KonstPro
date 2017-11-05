function BoyPktL = BoyPktL(nelem,elem,l,nPktL, PktL,fim)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    BoyPktL                                                       %
% Funksjon: Regner bøyemomentet under punktlaster. Tester først om lasten %
%           er på riktig element. 
% Oppdatert: 2017-11-03                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

BoyPktL = zeros(nelem,1); 

    for i = 1:nPktL
        element = PktL(i,1);    % Elementet lasten virker på  
        P = PktL(i,2);          % Lastamplituden 
        alpha = PktL(i,3);      % Avstandenskoeffisienten 
        L  = l(i);              % Lengden av elementet lasten virker på         
        a = L*alpha;            % Avstand fra knutepunkt 1 til lasten
        b = L - a;              % Avstand fra knutepunkt 2 til lasten

        if (alpha > 0) && (alpha < 1)
            m = -P*(a*b/L);    

        elseif (alpha == 0) || (alpha == 1)
            fprintf('Lasten virker rett i et knutepunkt')
            m = 0;
     
        else  
            fprintf('Error: Lasten er "utenfor" elementet'); 
            m = 0;
        end
        
        % Momentet på midten pga. fastinnspenningsmomentene.
        m_ende = (1/L)*((-fim(i,1)*b)+(fim(i,2)*a)); 
        
        % Det totale momentet på midten pga punktlasten 
        BoyPktL(element,1) = BoyPktL(i,1) + m + m_ende;  
    end
end

