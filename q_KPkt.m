function [q0_KPkt,stig] = q_KPkt(nelem, elem, l, nFlast, Flast,npunkt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    q_elem                                                        %
% Funksjon: Regner inn amplitudene i knutepunkt 1 og 2 for tilfellene der %
%           vi har jevnt fordelt                                          %
% Oppdatert: 2017-11-01                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Beregner last i knutepunktene n�r vi har jevnt fordelt last...\n')

%% NYTT FORS�K ONSDAG 01.11.2018
q0_KPkt = zeros(nelem,2);            % Initialiserer q0_Kpkt


for i = 1:nFlast
    if Flast(i,1) == 1                  % De som bare f�r over ett element
        element  = Flast(i,4);          % Lasten elementet g�r over
        KPkt_a   = elem(element,1);     % Elementets f�rste knutepunkt
        KPkt_b   = elem(element,2);     % Elementets andre knutepunkt
        q_a      = Flast(i,2);          % Amplituden i f�rste knutepunkt
        q_b      = Flast(i,3);          % Amplituden i andre knutepunkt
        q0_KPkt(i,KPkt_a) = q_a;        % Amplituden tilordnes i KPkt a
        q0_KPkt(i,KPkt_b) = q_b;        % Amplituden tilordnes i KPkt b
         
    elseif Flast(i,1) > 0               % De som g�r over flere elementer
    
    else                            % Om en last g�r over under ett element
        fprintf('Error - Lasten g�r over mindre enn et element!\n'); 
        
    end
end

stig = 1; 

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
%         fprintf('Error! Denne lasten g�r over mindre enn ett element!\n')
%     end  
%     
%     stig(i,1) = Flast(i,2)/l_last(i,1); % Regner ut stigningstallene
%     stig(i,2) = Flast(i,3)/l_last(i,1);
% end 
% 
% 
% % Regner ut n�r lasten er jevnt fordelt     NB!! KAN FJERNE DETTE N�R DEN
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