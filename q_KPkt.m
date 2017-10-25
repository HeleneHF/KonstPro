function [q_KPkt,stig] = q_KPkt(nelem, elem, l, nJfL, JfL,npunkt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    q_elem                                                        %
% Funksjon: Regner inn amplitudene i knutepunkt 1 og 2 for tilfellene der %
%           vi har jevnt fordelt last som går over mer enn ett element    %
% Oppdatert: 2017-10-24                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Beregner last i knutepunktene når vi har jevnt fordelt last...\n')

% Setter av plass
l_last = zeros(nJfL,1); 
stig = zeros(nJfL,2);
q_KPkt = zeros(npunkt,1); 
% element = zeros(nJfL,1); 

% Beregninger per last
for i = 1:nJfL
    if JfL(i,1) > 0             % Regner ut lengdene
        for j = 1:JfL(i,1)
            l_last(i,1) = l_last(i,1) + l(JfL(i,3+j));  
        end
    else
        fprintf('Error! Denne lasten går over mindre enn ett element!\n')
    end  
    
    stig(i,1) = JfL(i,2)/l_last(i,1); % Regner ut stigningstallene
    stig(i,2) = JfL(i,3)/l_last(i,1);
end 


% Regner ut når lasten er jevnt fordelt
for i = 1:nJfL
    for j = 1:JfL(i,1)
        KPkt1 = elem((JfL(i, 3+j)),1);  
        KPkt2 = elem((JfL(i, 3+j)),2); 
        
        if stig(i,1) == 0 || stig(i,2) == 0
            q_KPkt(KPkt1) = JfL(i,2);
            q_KPkt(KPkt2) = JfL(i,3);
        
        else % FREMDELES NOE VELDIG GALT HER!
            last1 = stig(i,1)*l(JfL(i,3+1));
            last2 = -stig(i,2)*l(JfL(i+3)); 
            q_KPkt(KPkt1) = stig(i,1) + last2;
            q_KPkt(KPkt2) = last1 + last2;
        end
    end
end

fprintf('Laster i knutepunktene beregnet\n')

% KUN TEST! TIL  NÅ REGNES BARE LENGDENE UT
%q_KPkt = l_last;
end