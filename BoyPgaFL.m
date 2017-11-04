function m_midt = BoyPgaFL(nelem,elem,l,q0_KPkt,endemoment); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    BoyPgaFL                                                      %
% Funksjon:                                                               %
% Oppdatert: 2017-11-04                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m_midt = zeros(nelem,1);    % Initialiserer 

for i = 1:nelem
    l_elem = l(i);         % Lengden av elementet
    
    q_a = q0_KPkt(i,1);    % Amplitude ende a
    q_b = q0_KPkt(i,2);    % Amplitude ende b
    
    % Splitter opp i to trekantlaster
    m_midt_a = q_a*l_elem^2*(1/16); % Momentet på midten pga trekantlast 1
    m_midt_b = q_b*l_elem^2*(1/16); % Momentet på midten pga trekantlast 2
   
    % Tar inn fastinnspenningsmomentene
    endeM_a = endemoment(i,1);         % Endemoment ende a 
    endeM_b = endemoment(i,2);         % Endemoment ende b
    
    m_midt(i) = m_midt_a + m_midt_b - (endeM_a + endeM_b); %  Midtmomentet
end 