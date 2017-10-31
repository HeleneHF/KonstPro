function l = lastvektor (fastinn_mom, mom_ytre, nelem, npunkt, elem)

l = zeros (npunkt, 1);

for i = 1:nelem
    punkt1 = elem(i,1);
    punkt2 = elem(i,2);
    
    l(punkt1,1) = l(punkt1,1) - fastinn_mom(i,1);
    l(punkt2,1) = l(punkt2,1) - fastinn_mom(i,2);
    
end 

l = l + mom_ytre;

end 