function m_midt = BoyPgaFL(nelem,l,q0_KPkt,endemoment); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    BoyPgaFL                                                      %
% Funksjon:                                                               %
% Oppdatert: 2017-11-04                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m_midt = zeros(nelem,1);    % Initialiserer 

for i = 1:nelem
    L = l(i);         % Lengden av elementet
    
    q_a = q0_KPkt(i,1);    % Amplitude ende a
    q_b = q0_KPkt(i,2);    % Amplitude ende b
    
    % Tar inn fastinnspenningsmomentene
    endeM_a = endemoment(i,1);         % Endemoment ende a 
    endeM_b = endemoment(i,2);         % Endemoment ende b
    
    % Om jevnt fordelt last
    if q_a == q_b
        m_midt_jf = q_a*L^2*(1/8); % Momentet på midten pga trekantlast 1
        m_midt(i) = m_midt_jf - (endeM_a + endeM_b);
        
    % Trekantlast (deler opp i tre trekantlaster)
    else
        m_midt_jf = q_a*L^2*(1/8); % Momentet på midten pga trekantlast 1
        m_midt_trapes = (q_b-q_a)*L^2*(1/16);       % Ta hensyn til om qa > qb??
        m_midt(i) = m_midt_jf + m_midt_trapes - (endeM_a + endeM_b); 
    end
    
end