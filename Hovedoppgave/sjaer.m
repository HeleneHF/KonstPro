function V = sjaer(nelem, elem,l,endemoment,nPktL,PktL,nFlast,Flast,q0_KPkt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    sjaer                                                         %
% Funksjon:                                                               %
% Oppdatert: 2017-11-05                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
V = zeros(nelem,2);

for i = 1:nelem
    M1 = endemoment(i,1); 
    M2 = endemoment(i,2); 
    L = l(i); 
    V(i,1:2) = (M1 + M2)*(1/L); 
    
        for j = 1:nPktL
            P = PktL(j,2);     % Amplituden til punktlasten 
            a = L*alpha;       % Avstand fra knutepunkt 1 til lasten
            b = L - a;         % Avstand fra knutepunkt 2 til lasten
            
            V(i,1) = -V(i,1) + (P*b)*(1/L); % Skjærkraft ende 1 "Det vi har fra før
            V(i,2) = -V(i,2) + (- (P*a)*(1/L)); % Skjærkraft ende 2    
        end

        for k = 1:nFlast
            nElement = Flast(k,1); 
                for h = 1:nElement
                    element = Flast(k,h+3);
                    KPkt1 = elem(element,1);
                    KPkt2 = elem(element,2); 
                    
                    q_a = q0_KPkt(KPkt1); 
                    q_b = q0_KPkt(KPkt2); 
                    
                    
                end
        
        end

end

