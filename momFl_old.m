function momFlast = momFl(q0_KPkt,nelem,l)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    momFl                                                         %
% Funksjon:                                                               %
% Oppdatert: 2017-11-02                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

momFlast = zeros(nelem,2);       % Initialiserer momFlast


for i = 1:nelem
   q_a = q0_KPkt(i,1);
   q_b = q0_KPkt(i,2);
   
   
   m_ab_1 = -(1/20)*(l(i)^2)*q_a;
   m_ba_1 =  (1/30)*(l(i)^2)*q_a; 
   
   m_ab_2 = -(1/30)*(l(i)^2)*q_b; 
   m_ba_2 =  (1/20)*(l(i)^2)*q_b;
   
   
   m_ab = m_ab_1 + m_ab_2; 
   m_ba = m_ba_1 + m_ba_2; 
   
   momFlast(i,1) = momFlast(i,1) + m_ab;  
   momFlast(i,2)  = momFlast(i,2) + m_ba;
   
end

end

