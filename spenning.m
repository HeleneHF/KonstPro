function sigma = spenning(profil,nelem,elem,I,endemoment,m_midt)

sigma = zeros(nelem,3); 

for i = 1:nelem
    profilType = elem(i,4);
    M1 = endemoment(i,1) % Endemoment ende 1
    M2 = endemoment(i,2) % Endemoment ende 2  
    M3 = m_midt(i,1)     % Midtmoment 
        
    if profilType == 1      % I-Profil
        y = 0.5*profil(1,2); 
        sigma(i,1) = (M1*y)/I(1); 
        sigma(i,2) = (M2*y)/I(1); 
        sigma(i,3) = (M3*y)/I(1);
        
    elseif profilType == 2  % Rør-Profil
        y = 0.5*profil(2,2); 
        sigma(i,1) = (M1*y)/I(2); 
        sigma(i,2) = (M2*y)/I(2); 
        sigma(i,3) = (M3*y)/I(2);
        
    else
        fprintf('Error: Ugyldig profil! Kun definert I- og rør-profil')
    end
    
end


end

