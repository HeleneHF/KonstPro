function hyp = lengde (punkt, elem, nelem)

hyp = zeros (nelem,1);

for i = 1:nelem
    
    kat_x = punkt(elem(i,1),1) - punkt(elem(i,2),1);
    kat_y = punkt(elem(i,1),2) - punkt(elem(i,2),2);
    
    hyp(i) = sqrt(kat_x^2 + kat_y^2);
    
end

end 