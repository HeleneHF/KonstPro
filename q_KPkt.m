function q0_KPkt = q_KPkt(nelem, elem, l, nFlast, Flast,npunkt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    q_elem                                                        %
% Funksjon: Regner inn amplitudene i knutepunkt 1 og 2 for tilfellene der %
%           vi har jevnt fordelt last over et eller flere elementer       %
% Oppdatert: 2017-11-01                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Beregner last i knutepunktene når vi har jevnt fordelt last...\n')

%% NYTT FORSØK ONSDAG 01.11.2018
q0_KPkt = zeros(nelem,2);               % Initialiserer q0_Kpkt


for i = 1:nFlast
    if Flast(i,1) == 1                  % Når de bare går over ett element
        element  = Flast(i,4);          % Lasten elementet går over
        
        q_a      = Flast(i,2);          % Amplituden i første knutepunkt
        q_b      = Flast(i,3);          % Amplituden i andre knutepunkt
        
        q0_KPkt(element,1) = q_a;       % Amplituden tilordnes i KPkt a
        q0_KPkt(element,2) = q_b;       % Amplituden tilordnes i KPkt b
        
         
    elseif Flast(i,1) > 0               % Når de går over flere elementer
        elements = Flast(i,4:end);      % Elementene lasten går over
        
        for j = 1:4                     % For hver last
            if elements(j) > 0
               element = elements(j);           % Elementnummer for denne lasten
            else
                fprintf('Error! Lasten går ikke over et element\n'); 
            end
          KPkt_a   = elem(element,1);      % Elementets første knutepunkt
          KPkt_b   = elem(element,2);      % Elementets andre knutepunkt
          
        end
    
        
    else                                % Last over mindre enn ett element
        fprintf('Error - Lasten går over mindre enn et element!\n'); 
        
    end
end

%% ELDRE TEST
% % Setter av plass
% l_last = zeros(nFlast,1); 
% stig = zeros(nFlast,2);
% q_KPkt = zeros(npunkt,1); 
% % element = zeros(nJfL,1); 
% 
% % Beregninger per last
% for i = 1:nFlast
%     if Flast(i,1) > 0             % Regner ut lengdene
%         for j = 1:Flast(i,1)
%             l_last(i,1) = l_last(i,1) + l(Flast(i,3+j));  
%         end
%     else
%         fprintf('Error! Denne lasten går over mindre enn ett element!\n')
%     end  
%     
%     stig(i,1) = Flast(i,2)/l_last(i,1); % Regner ut stigningstallene
%     stig(i,2) = Flast(i,3)/l_last(i,1);
% end 
% 
% 
% % Regner ut når lasten er jevnt fordelt     NB!! KAN FJERNE DETTE NÅR DEN
% % OVER FUNKER
% for i = 1:nFlast
%     for j = 1:Flast(i,1)
%         KPkt1 = elem((Flast(i, 3+j)),1);  
%         KPkt2 = elem((Flast(i, 3+j)),2); 
%         
%         if stig(i,1) == 0 || stig(i,2) == 0
%             q_KPkt(KPkt1) = Flast(i,2);
%             q_KPkt(KPkt2) = Flast(i,3);
%         
%         else % FREMDELES NOE VELDIG GALT HER!
%             last1 = stig(i,1)*l(Flast(i,3+1));
%             last2 = -stig(i,2)*l(Flast(i+3)); 
%             q_KPkt(KPkt1) = stig(i,1) + last2;
%             q_KPkt(KPkt2) = last1 + last2;
%         end
%     end
% end
% 
fprintf('Laster i knutepunktene beregnet\n')
end