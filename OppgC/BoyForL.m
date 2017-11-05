function BoyForL = BoyForL(nelem,l,q0_KPkt,endeMom)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    BoyForL                                                       %
% Funksjon: Beregner bøyemomentet på midten av bjelken for fordelte       %
%           laster. Dersom lasten er jevnt fordelt brukes formelen direkte%
%           for å finne momentet på midten. Dersom det er en trapeslast   %
%           deles den opp i en jevnt fordelt last og en trekantlast som   %
%           senere superposisjoneres.                                     %
% Oppdatert: 2017-11-05                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

BoyForL = zeros(nelem,1);   % Momentet på midten pga. jevnt fordelt last

for i = 1:nelem
    L = l(i);               % Lengden av elementet
    q_a = q0_KPkt(i,1);     % Amplitude ende a
    q_b = q0_KPkt(i,2);     % Amplitude ende b
    
    endeMom_a = endeMom(i,1);         % Endemoment ende a 
    endeMom_b = endeMom(i,2);         % Endemoment ende b
    
%------------------------- Jevnt fordelt last -----------------------------
    if q_a == q_b
        midtMom_jf = q_a*L^2*(1/8); % midtmoment fra jevnt fordelt last
        BoyForL(i) = midtMom_jf + (endeMom_a + endeMom_b); 
                
%------------------------- Trekantlast ------------------------------------        
       elseif (q_a == 0) || (q_b == 0) 
           if abs(q_a) > abs(q_b)                  % Størst i ende a  
               midtMom_trekant = q_a*L^2*(1/16);  
           else                                     % Størst i ende b
               midtMom_trekant = q_b*L^2*(1/16);
           end 
        BoyForL(i) = midtMom_trekant + (endeMom_a + endeMom_b); 

%------------------------- Trapeslaster -----------------------------------
    else
        % Jevnt fordelt bidrag
        midtMom_jf = q_a*L^2*(1/8); 
        
        % Trekantbidrag
        if abs(q_a) > abs(q_b)                
            midtMom_trapes = (q_a-q_b)*L^2*(1/16);      
        else 
            midtMom_trapes = (q_b-q_a)*L^2*(1/16);
        end
        
        % Superposjsonerer 
        BoyForL(i) = midtMom_jf + midtMom_trapes + (endeMom_a + endeMom_b); 
    end     
end
fprintf('Bøyemoment midt på bjelkene med fordelt last regnet ut\n')

end