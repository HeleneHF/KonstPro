function fim = moment(npunkt,punkt,nelem,elem,l, nPktL, PktL,nFlast,Flast,nMom,Mom)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    Moment                                                        %
% Funksjon: Regner ut fastinnspenningsmomentet + FORNUFTIG FORKLARING     %
% Oppdatert: 2017-10-31                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fim = zeros(nelem,2); 

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

% Fordelt last - Må få ferdig den andre først
for j = 1:nFlast
    
end

% Ytre momenter - Funker på et knutepunkt, ikke et element... 
% for i = 1:nMom
%     
% end

end

