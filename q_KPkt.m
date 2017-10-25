function [q_KPkt,stig] = q_KPkt(nelem, l, nJfL, JfL,npunkt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    q_elem                                                        %
% Funksjon: Regner inn amplitudene i knutepunkt 1 og 2 for tilfellene der %
%           vi har jevnt fordelt last som går over mer enn ett element    %
% Oppdatert: 2017-10-24                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Beregner last i knutepunktene når vi har jevnt fordelt last...\n')

% Startparameter
l_last = zeros(nJfL,1); 
stig = zeros(nJfL,1);
q_KPkt = zeros(npunkt,1); 

% Regner ut lengdene
for i = 1:nJfL
    
    if JfL(i,1) > 0
        for j = 1:JfL(i,1)
            l_last(i,1) = l_last(i,1) + l(JfL(i,2+j));  
        end
    else
        fprintf('Error! Denne lasten går over mindre enn ett element!\n')
    end  
end 

% Regner ut stigningstallene
for i = 1:nJfL
    stig(i) = (JfL(i,2) - JfL(i,3))/l_last(i,1);
end

for i = 1:npunkt 
    for j = 1:nJfL
        if stig(j) == 0
            q_KPkt(i) = JfL(j)
        else
            q = 

        end
    end
end

fprintf('Laster i knutepunktene beregnet\n')

% KUN TEST! TIL  NÅ REGNES BARE LENGDENE UT
q_KPkt = l_last;
end